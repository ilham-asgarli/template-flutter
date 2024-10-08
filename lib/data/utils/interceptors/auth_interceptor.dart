import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../presentation/utils/constants/cache/flutter_secure_storage_constants.dart';
import '../../datasources/auth/remote/auth.remote.datasource.dart';
import '../../models/auth/token.model.dart';
import '../../models/base/base.model.dart';
import '../constants/api/api_url_constants.dart';

class RevokeTokenException extends DioException {
  RevokeTokenException({required super.requestOptions});
}

@lazySingleton
class AuthInterceptor extends QueuedInterceptor {
  final Dio dio;
  final FlutterSecureStorage secureStorage;
  final bool shouldClearBeforeReset;
  late final Dio retryClient;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthInterceptor({
    required this.dio,
    required this.secureStorage,
    this.shouldClearBeforeReset = true,
    required this.authRemoteDataSource,
  }) {
    retryClient = Dio();
    retryClient.options = BaseOptions(baseUrl: dio.options.baseUrl);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final tokenModel = await _getTokenModel();

      if (tokenModel == null) {
        return handler.next(options);
      }

      final isAccessTokenValid = await _isAccessTokenValid;

      if (isAccessTokenValid) {
        options.headers.addAll(await _buildHeaders(options));
        return handler.next(options);
      } else {
        if (options.path == ApiUrlConstants.refreshToken) {
          return handler.reject(
            RevokeTokenException(requestOptions: options),
            true,
          );
        }

        final newTokenModel = await _refresh(
          options: options,
          tokenModel: tokenModel,
        );

        if (newTokenModel == null) {
          return handler.reject(
            RevokeTokenException(requestOptions: options),
            true,
          );
        }

        options.headers.addAll(await _buildHeaders(options));
        return handler.next(options);
      }
    } catch (_) {
      return handler.reject(
        RevokeTokenException(requestOptions: options),
        true,
      );
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err is RevokeTokenException) {
      // TODO: Sign out
      return handler.reject(err);
    }

    if (!shouldRefresh(err.response)) {
      return handler.next(err);
    }

    final isAccessValid = await _isAccessTokenValid;
    final tokenModel = await _getTokenModel();

    if (tokenModel == null) {
      return handler.reject(err);
    }

    try {
      if (isAccessValid) {
        final previousRequest = await _retry(err.requestOptions);
        return handler.resolve(previousRequest);
      } else {
        await _refresh(options: err.requestOptions, tokenModel: tokenModel);
        final previousRequest = await _retry(err.requestOptions);
        return handler.resolve(previousRequest);
      }
    } on RevokeTokenException {
      // TODO: Sign out
      return handler.reject(err);
    } on DioException catch (err) {
      return handler.next(err);
    }
  }

  Future<String?> get _accessToken =>
      secureStorage.read(key: FlutterSecureStorageConstants.accessToken);

  Future<String?> get _refreshToken =>
      secureStorage.read(key: FlutterSecureStorageConstants.refreshToken);

  Future<TokenModel?> _getTokenModel() async {
    final accessToken = await _accessToken;
    final refreshToken = await _refreshToken;

    if (accessToken != null && refreshToken != null) {
      return TokenModel(accessToken: accessToken, refreshToken: refreshToken);
    }
    return null;
  }

  Future<void> _saveTokenModel(TokenModel tokenModel) async {
    await secureStorage.write(
      key: FlutterSecureStorageConstants.accessToken,
      value: tokenModel.accessToken,
    );
    await secureStorage.write(
      key: FlutterSecureStorageConstants.refreshToken,
      value: tokenModel.refreshToken,
    );
  }

  Future<void> _clearTokenModel() async {
    await secureStorage.delete(key: FlutterSecureStorageConstants.accessToken);
    await secureStorage.delete(key: FlutterSecureStorageConstants.refreshToken);
  }

  Future<Map<String, dynamic>> _buildHeaders(options) async {
    final tokenModel = await _getTokenModel();
    String? token;

    if (options.path == ApiUrlConstants.refreshToken) {
      if (tokenModel?.refreshToken != null) {
        token = tokenModel?.refreshToken;
      }
    } else {
      if (tokenModel?.accessToken != null) {
        token = tokenModel?.accessToken;
      }
    }

    return {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }

  Future<bool> get _isAccessTokenValid async {
    final tokenModel = await _getTokenModel();

    if (tokenModel == null) {
      return false;
    }

    final decodedJwt = JWT.decode(tokenModel.accessToken);
    final expirationTimeEpoch = decodedJwt.payload['exp'];
    final expirationDateTime =
        DateTime.fromMillisecondsSinceEpoch(expirationTimeEpoch * 1000);

    const marginOfErrorInMilliseconds = 1000; // appr 1 seconds
    const addedMarginTime = Duration(milliseconds: marginOfErrorInMilliseconds);

    return DateTime.now().add(addedMarginTime).isBefore(expirationDateTime);
  }

  /// Check if the token pair should be refreshed
  @visibleForTesting
  @pragma('vm:prefer-inline')
  bool shouldRefresh<R>(Response<R>? response) =>
      (response?.statusCode == 401) &&
      response?.requestOptions.path != ApiUrlConstants.refreshToken;

  Future<TokenModel?> _refresh({
    required RequestOptions options,
    required TokenModel? tokenModel,
  }) async {
    if (tokenModel == null) {
      throw RevokeTokenException(requestOptions: options);
    }

    try {
      BaseModel<TokenModel> model = await authRemoteDataSource.refreshToken();

      if (shouldClearBeforeReset) {
        await _clearTokenModel();
      }

      await _saveTokenModel(model.data!);
      return model.data;
    } catch (_) {
      await _clearTokenModel();
      throw RevokeTokenException(requestOptions: options);
    }
  }

  Future<Response<R>> _retry<R>(
    RequestOptions requestOptions,
  ) async {
    return retryClient.request<R>(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data is FormData
          ? (requestOptions.data as FormData).clone()
          : requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        headers: requestOptions.headers
          ..addAll(await _buildHeaders(requestOptions)),
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        followRedirects: requestOptions.followRedirects,
        maxRedirects: requestOptions.maxRedirects,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        listFormat: requestOptions.listFormat,
      ),
    );
  }
}

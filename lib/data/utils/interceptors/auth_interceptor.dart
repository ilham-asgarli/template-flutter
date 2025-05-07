import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/token.entity.dart';
import '../../../domain/repositories/auth/local/auth.local.repository.dart';
import '../../../domain/repositories/auth/remote/auth.remote.repository.dart';
import '../../../presentation/features/auth/viewmodels/auth_cubit.dart';
import '../constants/remote/api_url_constants.dart';

class RevokeTokenException extends DioException {
  RevokeTokenException({required super.requestOptions});
}

class AuthInterceptor extends QueuedInterceptor {
  final Dio dio;
  final bool shouldClearBeforeReset;
  late final Dio retryClient;
  final AuthRemoteRepository authRemoteRepository;
  final AuthLocalRepository authLocalRepository;
  final AuthCubit authCubit;

  AuthInterceptor({
    required this.dio,
    this.shouldClearBeforeReset = true,
    required this.authRemoteRepository,
    required this.authLocalRepository,
    required this.authCubit,
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
      final tokenModel = await authLocalRepository.getTokenEntity();

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

        final newTokenEntity = await _refresh(
          options: options,
          tokenModel: tokenModel,
        );

        if (newTokenEntity == null) {
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
      await authCubit.logout();
      return handler.reject(err);
    }

    if (!shouldRefresh(err.response)) {
      return handler.next(err);
    }

    final isAccessValid = await _isAccessTokenValid;
    final tokenModel = await authLocalRepository.getTokenEntity();

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
      await authCubit.logout();
      return handler.reject(err);
    } on DioException catch (err) {
      return handler.next(err);
    }
  }

  Future<Map<String, dynamic>> _buildHeaders(options) async {
    final tokenModel = await authLocalRepository.getTokenEntity();
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
    final tokenModel = await authLocalRepository.getTokenEntity();

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

  Future<TokenEntity?> _refresh({
    required RequestOptions options,
    required TokenEntity? tokenModel,
  }) async {
    if (tokenModel == null) {
      throw RevokeTokenException(requestOptions: options);
    }

    try {
      TokenEntity model = await authRemoteRepository.refreshToken();

      if (shouldClearBeforeReset) {
        await authLocalRepository.clearTokenEntity();
      }

      await authLocalRepository.saveTokenEntity(model);
      return model;
    } catch (_) {
      await authLocalRepository.clearTokenEntity();
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

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../presentation/utils/constants/cache/flutter_secure_storage_constants.dart';
import '../../../utils/di/injectable.dart';
import '../../datasources/auth/remote/auth.remote.datasource.dart';
import '../../models/auth/token.model.dart';
import '../../models/base/base.model.dart';

class AuthInterceptor extends Interceptor {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthInterceptor({
    required this.authRemoteDataSource,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = await getIt<FlutterSecureStorage>()
        .read(key: FlutterSecureStorageConstants.accessToken);

    if (accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    String? refreshToken = await getIt<FlutterSecureStorage>()
        .read(key: FlutterSecureStorageConstants.refreshToken);

    if (err.response?.statusCode != 401 && refreshToken != null) {
      try {
        BaseModel<TokenModel> model =
            await authRemoteDataSource.refreshToken(refreshToken);

        getIt<FlutterSecureStorage>().write(
          key: FlutterSecureStorageConstants.accessToken,
          value: model.data?.accessToken,
        );

        getIt<FlutterSecureStorage>().write(
          key: FlutterSecureStorageConstants.refreshToken,
          value: model.data?.refreshToken,
        );

        err.requestOptions.headers[HttpHeaders.authorizationHeader] =
            "Bearer ${model.data?.accessToken}";

        return handler.resolve(await getIt<Dio>().fetch(err.requestOptions));
      } on DioException catch (e) {
        handler.reject(e);
      } catch (e) {
        handler.reject(err);
      }
    }

    return handler.next(err);
  }
}

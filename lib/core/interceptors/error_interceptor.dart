import 'dart:io';

import 'package:dio/dio.dart';

import '../errors/network/bad_request_error.dart';
import '../errors/network/client_error.dart';
import '../errors/network/conflict_error.dart';
import '../errors/network/custom_error.dart';
import '../errors/network/forbidden_error.dart';
import '../errors/network/internal_error.dart';
import '../errors/network/not_found_error.dart';
import '../errors/network/server_error.dart';
import '../errors/network/socket_error.dart';
import '../errors/network/unauthorized_error.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is SocketException) {
      throw SocketError();
    }

    if (err.response?.statusCode != null) {
      switch (err.response!.statusCode!) {
        case 400:
          throw BadRequestError();
        case 401:
          throw UnauthorizedError();
        case 403:
          throw ForbiddenError();
        case 404:
          throw NotFoundError();
        case 409:
          throw ConflictError();
        case >= 400 && < 500:
          throw ClientError();
        case 500:
          throw InternalError();
        case >= 500:
          throw ServerError();
      }
    }

    throw CustomError(message: err.message ?? "Custom Error");
  }
}

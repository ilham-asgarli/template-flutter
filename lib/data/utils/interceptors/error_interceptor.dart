import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../exceptions/network/bad_request.exception.dart';
import '../exceptions/network/client.exception.dart';
import '../exceptions/network/conflict.exception.dart';
import '../exceptions/network/custom.exception.dart';
import '../exceptions/network/forbidden.exception.dart';
import '../exceptions/network/internal.exception.dart';
import '../exceptions/network/not_found.exception.dart';
import '../exceptions/network/server.exception.dart';
import '../exceptions/network/socket.exception.dart' as s_e;
import '../exceptions/network/timeout.exception.dart' as t_e;
import '../exceptions/network/unauthorized.exception.dart';

@lazySingleton
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is SocketException) {
      throw s_e.SocketException(message: err.message);
    } else if (err.error is TimeoutException) {
      throw t_e.TimeoutException(message: err.message);
    }

    if (err.response?.statusCode != null) {
      switch (err.response!.statusCode!) {
        case 400:
          throw BadRequestException(message: err.message);
        case 401:
          throw UnauthorizedException(message: err.message);
        case 403:
          throw ForbiddenException(message: err.message);
        case 404:
          throw NotFoundException(message: err.message);
        case 409:
          throw ConflictException(message: err.message);
        case >= 400 && < 500:
          throw ClientException(message: err.message);
        case 500:
          throw InternalException(message: err.message);
        case >= 500:
          throw ServerException(message: err.message);
      }
    }

    throw CustomException(message: err.message);
  }
}

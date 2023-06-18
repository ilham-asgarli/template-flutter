import '../../../core/base/models/base_http.dart';

class HttpException implements Exception {
  final BaseHttp? _baseHttp;
  final dynamic _prefix;

  HttpException([
    this._baseHttp,
    this._prefix,
  ]);

  @override
  String toString() {
    return "$_prefix${_baseHttp?.message}";
  }
}

class FetchDataException extends HttpException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends HttpException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}

class NotFoundException extends HttpException {
  NotFoundException([message]) : super(message, "Not Found: ");
}

class ServerException extends HttpException {
  ServerException([message]) : super(message, "Server Error: ");
}

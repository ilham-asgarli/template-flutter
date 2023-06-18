part of 'core_http.dart';

extension _CoreHttpOperations on CoreHttp {
  _sendRequest(
    String url, {
    required HttpTypes type,
    required data,
    String? accessToken,
  }) async {
    http.Response? response;

    try {
      switch (type) {
        case HttpTypes.get:
          response = await http.Client().get(
            Uri.parse(url),
            headers: <String, String>{
              HttpHeaders.authorizationHeader: accessToken ?? "",
            },
          );
          break;
        case HttpTypes.post:
          response = await http.Client().post(
            Uri.parse(url),
            headers: <String, String>{
              HttpHeaders.authorizationHeader: accessToken ?? "",
              HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
            },
            body: data != null ? jsonEncode(data) : null,
            encoding: Encoding.getByName("utf-8"),
          );
          break;
        default:
          response = null;
      }

      return response;
    } on SocketException {
      BaseHttp? baseHttp = _responseParser<BaseHttp, BaseHttp>(
        BaseHttp.fromJson,
        {"message": "No Internet connection"},
      );
      throw FetchDataException(baseHttp);
    }
  }

  R _returnResponse<R, T>(
    http.Response response, {
    required T Function(Map<String, dynamic>)? fromJson,
  }) {
    dynamic jsonDecoded = json.decode("{}");

    if (response.body.isNotEmpty) {
      jsonDecoded = json.decode(utf8.decode(response.bodyBytes));
    }

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return _responseParser<R, T>(fromJson, jsonDecoded);
    } else {
      BaseHttp? baseHttp =
          _responseParser<BaseHttp, BaseHttp>(BaseHttp.fromJson, jsonDecoded);

      switch (response.statusCode) {
        case 400:
          throw BadRequestException(baseHttp);
        case 401:
          throw InvalidInputException(baseHttp);
        case 403:
          throw UnauthorisedException(baseHttp);
        case 404:
          throw NotFoundException(baseHttp);
        case 500:
          throw ServerException(baseHttp);
        default:
          throw FetchDataException(baseHttp);
      }
    }
  }

  R _responseParser<R, T>(
    T Function(Map<String, dynamic>)? fromJson,
    dynamic data,
  ) {
    if (fromJson == null) {
      return data as R;
    }

    if (data is List) {
      return data.map((e) => fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return fromJson(data as Map<String, dynamic>) as R;
    }

    return data as R;
  }
}

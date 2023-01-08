import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../utils/logic/constants/api/api_url_constants.dart';
import '../../base/models/base_error.dart';
import '../../base/models/base_http.dart';
import '../../base/models/base_model.dart';
import '../../base/models/base_response.dart';
import '../../base/models/base_success.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../exceptions/network/http_exception.dart';

part 'core_operations.dart';

class CoreHttp {
  static final CoreHttp _instance = CoreHttp._init();

  static CoreHttp get instance => _instance;

  CoreHttp._init();

  Future<BaseResponse<R>> send<R, T extends BaseModel>(
    String url, {
    required HttpTypes type,
    required T parseModel,
    data,
    accessToken,
  }) async {
    try {
      http.Response? response = await _sendRequest(
        url,
        type: type,
        data: data,
        accessToken: accessToken,
      );

      if (response != null) {
        try {
          final model = _returnResponse<R, T>(response, parseModel: parseModel);
          return BaseSuccess<R>(data: model);
        } on InvalidInputException catch (e) {
          return BaseError(message: e.toString());
        } on Exception catch (e) {
          return BaseError(message: e.toString());
        }
      } else {
        return BaseError(message: "Wrong http method");
      }
    } on Exception catch (e) {
      return BaseError(message: e.toString());
    }
  }
}

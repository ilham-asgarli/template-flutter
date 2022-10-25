import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../../core/base/models/base_http.dart';
import '../../../utils/app/constants/api/api_url_constants.dart';
import '../../../utils/app/constants/enums/http_request_enum.dart';
import '../../base/models/base_error.dart';
import '../../base/models/base_model.dart';
import '../../exceptions/network/http_exception.dart';
import 'interfaces/response_model.dart';

part 'core_operations.dart';

class CoreHttp {
  static final CoreHttp _instance = CoreHttp._init();

  static CoreHttp get instance => _instance;

  CoreHttp._init();

  Future<IResponseModel<R>> send<R, T extends BaseModel>(
    String url, {
    required HttpTypes type,
    required T parseModel,
    data,
    accessToken,
  }) async {
    try {
      Response? response = await _sendRequest(
        url,
        type: type,
        data: data,
        accessToken: accessToken,
      );

      if (response != null) {
        try {
          final model = _returnResponse<R, T>(response, parseModel: parseModel);
          return ResponseModel<R>(data: model);
        } on InvalidInputException catch (e) {
          return ResponseModel(error: BaseError(e.toString()));
        } on Exception catch (e) {
          return ResponseModel(error: BaseError(e.toString()));
        }
      } else {
        return ResponseModel(error: BaseError("Wrong http method"));
      }
    } on Exception catch (e) {
      return ResponseModel(error: BaseError(e.toString()));
    }
  }
}

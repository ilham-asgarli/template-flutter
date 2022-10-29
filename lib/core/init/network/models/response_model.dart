import '../interfaces/error_model.dart';
import '../interfaces/response_model.dart';

class ResponseModel<T> implements IResponseModel<T> {
  @override
  T? data;

  @override
  IErrorModel? error;

  ResponseModel({this.data, this.error});
}
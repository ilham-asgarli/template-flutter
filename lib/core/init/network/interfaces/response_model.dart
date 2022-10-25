abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {
  String? message;
}

class ResponseModel<T> implements IResponseModel<T> {
  @override
  T? data;

  @override
  IErrorModel? error;

  ResponseModel({this.data, this.error});
}

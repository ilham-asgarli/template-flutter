import 'base_response.dart';

class BaseSuccess<T> implements BaseResponse {
  BaseSuccess({this.data, this.message});

  T? data;

  @override
  String? message;
}

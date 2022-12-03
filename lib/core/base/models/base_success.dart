import 'base_response.dart';

class BaseSuccess<T> extends BaseResponse<T> {
  BaseSuccess({this.data, super.message});

  T? data;
}

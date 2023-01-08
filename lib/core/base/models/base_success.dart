import 'base_response.dart';

class BaseSuccess<T> extends BaseResponse<T> {
  BaseSuccess({required this.data, super.message});

  T data;
}

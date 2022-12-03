import 'base_response.dart';

class BaseError<T> extends BaseResponse<T> {
  BaseError({super.message});
}

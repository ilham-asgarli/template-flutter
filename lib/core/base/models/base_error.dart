import 'base_response.dart';

class BaseError implements BaseResponse {
  BaseError({this.message});

  @override
  String? message;
}

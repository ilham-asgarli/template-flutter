abstract class BaseResponse<T> {
  String? message;

  BaseResponse({this.message});

  @override
  String toString() {
    return message ?? "";
  }
}

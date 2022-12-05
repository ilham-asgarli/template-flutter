abstract class BaseResponse<T> extends Error {
  String? message;

  BaseResponse({this.message});

  @override
  String toString() {
    return message ?? "";
  }
}

import 'base_model.dart';

class BaseHttp implements BaseModel {
  String? message;
  dynamic code;

  BaseHttp({this.message, this.code});

  @override
  fromJson(Map<String, dynamic> json) {
    return BaseHttp(
      message: json["message"],
      code: json["code"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
      };
}

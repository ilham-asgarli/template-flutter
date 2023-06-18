class BaseHttp {
  String? message;
  dynamic code;

  BaseHttp({this.message, this.code});

  @override
  factory BaseHttp.fromJson(Map<String, dynamic> json) {
    return BaseHttp(
      message: json["message"],
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
      };
}

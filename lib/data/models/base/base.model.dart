import '../../utils/enums/api_enum.dart';

class BaseModel<T> {
  final Status status;
  final String? message;
  final List? errors;
  final T? data;

  const BaseModel({
    required this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory BaseModel.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseModel(
      status: Status.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => Status.success,
      ),
      message: json['message'],
      errors: json['errors'],
      data: fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'status': status.name,
      'message': message,
      'errors': errors,
      'data': data == null ? null : toJsonT(data as T),
    };
  }
}

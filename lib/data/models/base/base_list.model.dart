import '../../utils/enums/api_enum.dart';

class BaseListModel<T> {
  final Status status;
  final String message;
  final List? errors;
  final List<T> data;

  const BaseListModel({
    required this.status,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory BaseListModel.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseListModel(
      status: Status.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => Status.success,
      ),
      message: json['message'] as String,
      errors: json['errors'] as List?,
      data: (json['data'] as List).map((e) => fromJsonT(e)).toList(),
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'status': status.name,
      'message': message,
      'errors': errors,
      'data': data.map((e) => toJsonT(e)).toList(),
    };
  }
}

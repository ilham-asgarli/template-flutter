import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/helpers/json-serializable/date_time_converter.dart';
import '../../utils/enums/api_enum.dart';

part 'base.model.freezed.dart';
part 'base.model.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseModel<T> with _$BaseModel<T> {
  const BaseModel._();

  @DateTimeConverter()
  const factory BaseModel({
    required Status status,
    required String? message,
    required List? errors,
    required T? data,
  }) = _BaseModel<T>;

  factory BaseModel.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseModelFromJson<T>(json, fromJsonT);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      super.toJson((p0) => p0);
}

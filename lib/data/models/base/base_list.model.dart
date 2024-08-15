import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/helpers/json-serializable/date_time_converter.dart';
import '../../utils/enums/api_enum.dart';

part 'base_list.model.freezed.dart';
part 'base_list.model.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseListModel<T> with _$BaseListModel<T> {
  const BaseListModel._();

  @DateTimeConverter()
  const factory BaseListModel({
    required Status status,
    required String message,
    required List? errors,
    required List<T> data,
  }) = _BaseListModel<T>;

  factory BaseListModel.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseListModelFromJson<T>(json, fromJsonT);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      super.toJson((p0) => p0);
}

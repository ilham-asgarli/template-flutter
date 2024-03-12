import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/helpers/json-serializable/date_time_converter.dart';

part 'detailed_pagination.model.freezed.dart';
part 'detailed_pagination.model.g.dart';

@Freezed(genericArgumentFactories: true)
class DetailedPaginationModel<T> with _$DetailedPaginationModel<T> {
  const DetailedPaginationModel._();

  @DateTimeConverter()
  const factory DetailedPaginationModel({
    required bool more,
    required int page,
    required int pageSize,
    required int total,
    required List<T> collection,
  }) = _DetailedPaginationModel<T>;

  factory DetailedPaginationModel.fromJson(
    Map<String, Object?> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$DetailedPaginationModelFromJson<T>(json, fromJsonT);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      super.toJson((p0) => p0);
}

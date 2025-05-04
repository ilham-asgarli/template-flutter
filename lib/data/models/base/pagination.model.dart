import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/helpers/json-serializable/date_time_converter.dart';

part 'pagination.model.freezed.dart';
part 'pagination.model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginationModel<T> with _$PaginationModel<T> {
  const PaginationModel._();

  @DateTimeConverter()
  const factory PaginationModel({
    required bool more,
    required int page,
    required List<T> collection,
  }) = _PaginationModel<T>;

  factory PaginationModel.fromJson(
    Map<String, Object?> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginationModelFromJson<T>(json, fromJsonT);

  /*@override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      super.toJson((p0) => p0);*/
}

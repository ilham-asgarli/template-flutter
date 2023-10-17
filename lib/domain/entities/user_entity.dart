import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/helpers/json-serializable/date_time_converter.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@Freezed(copyWith: false, equal: false)
class UserEntity with _$UserEntity {
  @DateTimeConverter()
  const factory UserEntity({
    required String id,
    required String email,
    required String password,
    required DateTime createdAt,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);
}

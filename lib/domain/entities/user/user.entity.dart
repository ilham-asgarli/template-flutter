import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/user/user.model.dart';
import '../../../utils/helpers/json-serializable/date_time_converter.dart';

part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

@Freezed(copyWith: false, equal: false)
class UserEntity with _$UserEntity {
  @DateTimeConverter()
  const factory UserEntity({
    required String email,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      email: model.email,
    );
  }
}

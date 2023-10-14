import 'package:fnv/fnv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../../utils/helpers/json-serializable/date_time_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
@Collection(ignore: {'copyWith'})
class User with _$User {
  const User._();

  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
    includeIfNull: false,
  )
  @DateTimeConverter()
  const factory User(
    String id,
    String email,
    String password,
    DateTime createdAt,
  ) = _User;

  Id get isarId => fnv1_64_s(id);

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

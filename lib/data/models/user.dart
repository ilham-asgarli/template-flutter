import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
    includeIfNull: false,
  )
  @DateTimeConverter()
  const factory User(
    String email,
    int password,
    DateTime createdAt,
  ) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

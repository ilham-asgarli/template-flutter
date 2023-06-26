import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/logic/helpers/json-serializable/date_time_converter.dart';

part 'sign_up.freezed.dart';
part 'sign_up.g.dart';

@Freezed()
abstract class SignUp with _$SignUp {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
    includeIfNull: false,
  )
  @DateTimeConverter()
  const factory SignUp(
    String email,
    int password,
  ) = _SignUp;

  factory SignUp.fromJson(Map<String, Object?> json) => _$SignUpFromJson(json);
}

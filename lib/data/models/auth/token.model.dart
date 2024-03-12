import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/helpers/json-serializable/date_time_converter.dart';

part 'token.model.freezed.dart';
part 'token.model.g.dart';

@Freezed()
class TokenModel with _$TokenModel {
  const TokenModel._();

  @DateTimeConverter()
  const factory TokenModel({
    required String accessToken,
    required String refreshToken,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, Object?> json) =>
      _$TokenModelFromJson(json);
}

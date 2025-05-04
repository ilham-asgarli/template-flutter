import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/auth/token.model.dart';
import '../../../utils/helpers/json-serializable/date_time_converter.dart';

part 'token.entity.freezed.dart';
part 'token.entity.g.dart';

@Freezed(copyWith: false, equal: false)
abstract class TokenEntity with _$TokenEntity {
  @DateTimeConverter()
  const factory TokenEntity({
    required String accessToken,
    required String refreshToken,
  }) = _TokenEntity;

  factory TokenEntity.fromJson(Map<String, Object?> json) =>
      _$TokenEntityFromJson(json);

  factory TokenEntity.fromModel(TokenModel model) {
    return TokenEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }
}

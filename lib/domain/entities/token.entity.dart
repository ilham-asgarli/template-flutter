import '../../data/models/token.model.dart';

class TokenEntity {
  final String accessToken;
  final String refreshToken;

  const TokenEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenEntity.fromModel(TokenModel model) {
    return TokenEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }

  factory TokenEntity.fromJson(Map<String, dynamic> json) {
    return TokenEntity(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}

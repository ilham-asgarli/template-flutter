import '../../data/models/token.model.dart';
import 'user.entity.dart';

class TokenEntity {
  final String accessToken;
  final String refreshToken;
  final UserEntity? user;

  const TokenEntity({
    required this.accessToken,
    required this.refreshToken,
    this.user,
  });

  factory TokenEntity.fromModel(TokenModel model) {
    return TokenEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      user: model.user == null ? null : UserEntity.fromModel(model.user!),
    );
  }

  factory TokenEntity.fromJson(Map<String, dynamic> json) {
    return TokenEntity(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user?.toJson(),
    };
  }
}

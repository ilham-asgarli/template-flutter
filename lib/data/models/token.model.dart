import 'user.model.dart';

class TokenModel {
  final String accessToken;
  final String refreshToken;
  final UserModel? user;

  const TokenModel({
    required this.accessToken,
    required this.refreshToken,
    this.user,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'user': user?.toJson(),
    };
  }
}

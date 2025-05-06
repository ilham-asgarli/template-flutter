import '../../data/models/user.model.dart';

class UserEntity {
  final String email;

  const UserEntity({
    required this.email,
  });

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      email: model.email,
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

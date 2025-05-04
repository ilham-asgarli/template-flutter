import '../../../entities/auth/token.entity.dart';
import '../../../entities/user/user.entity.dart';

abstract class AuthRemoteRepository {
  Future<UserEntity> login(
      {required String username, required String password});
  Future<UserEntity> register(
      {required String username, required String password});
  Future<TokenEntity> refreshToken();
}

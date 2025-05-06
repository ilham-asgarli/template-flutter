import '../../../entities/token.entity.dart';

abstract class AuthRemoteRepository {
  Future<TokenEntity> login(
      {required String username, required String password});
  Future<TokenEntity> register(
      {required String username, required String password});
  Future<TokenEntity> refreshToken();
}

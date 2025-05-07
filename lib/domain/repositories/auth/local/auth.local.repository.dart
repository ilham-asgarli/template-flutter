import '../../../entities/token.entity.dart';

abstract class AuthLocalRepository {
  Future<TokenEntity?> getTokenEntity();
  Future<void> saveTokenEntity(TokenEntity tokenEntity);
  Future<void> clearTokenEntity();
}

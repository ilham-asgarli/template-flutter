import '../../../../domain/entities/token.entity.dart';
import '../../../../domain/repositories/auth/local/auth.local.repository.dart';
import '../../../datasources/auth/local/auth.local.datasource.dart';

class AuthLocalRepositoryImpl implements AuthLocalRepository {
  final AuthLocalDataSource authLocalDataSource;

  const AuthLocalRepositoryImpl({
    required this.authLocalDataSource,
  });

  @override
  Future<void> clearTokenEntity() async {
    await authLocalDataSource.clearTokenEntity();
  }

  @override
  Future<TokenEntity?> getTokenEntity() async {
    final tokenEntity = await authLocalDataSource.getTokenEntity();
    if (tokenEntity == null) {
      return null;
    }
    return TokenEntity(
      accessToken: tokenEntity.accessToken,
      refreshToken: tokenEntity.refreshToken,
    );
  }

  @override
  Future<void> saveTokenEntity(TokenEntity tokenEntity) async {
    await authLocalDataSource.saveTokenEntity(tokenEntity);
  }
}

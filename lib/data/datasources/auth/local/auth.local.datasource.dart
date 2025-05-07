import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../domain/entities/token.entity.dart';
import '../../../utils/constants/local/flutter_secure_storage_constants.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  const AuthLocalDataSource({
    required this.secureStorage,
  });

  Future<String?> get _accessToken =>
      secureStorage.read(key: FlutterSecureStorageConstants.accessToken);

  Future<String?> get _refreshToken =>
      secureStorage.read(key: FlutterSecureStorageConstants.refreshToken);

  Future<TokenEntity?> getTokenEntity() async {
    final accessToken = await _accessToken;
    final refreshToken = await _refreshToken;

    if (accessToken != null && refreshToken != null) {
      return TokenEntity(accessToken: accessToken, refreshToken: refreshToken);
    }
    return null;
  }

  Future<void> saveTokenEntity(TokenEntity tokenModel) async {
    await secureStorage.write(
      key: FlutterSecureStorageConstants.accessToken,
      value: tokenModel.accessToken,
    );
    await secureStorage.write(
      key: FlutterSecureStorageConstants.refreshToken,
      value: tokenModel.refreshToken,
    );
  }

  Future<void> clearTokenEntity() async {
    await secureStorage.delete(key: FlutterSecureStorageConstants.accessToken);
    await secureStorage.delete(key: FlutterSecureStorageConstants.refreshToken);
  }
}

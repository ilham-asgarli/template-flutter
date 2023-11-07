import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/repositories/security/local/security.local.repository.dart';
import '../../../datasources/security/local/security.local.datasource.dart';
import '../../../models/user_model.dart';
import '../../../utils/exceptions/local/not_found.exception.dart';

@LazySingleton(as: SecurityLocalRepository)
class SecurityLocalRepositoryImpl implements SecurityLocalRepository {
  final SecurityLocalDataSource securityLocalDataSource;

  const SecurityLocalRepositoryImpl({
    required this.securityLocalDataSource,
  });

  @override
  Future<UserEntity> getUser({required String id}) async {
    UserModel? userModel = await securityLocalDataSource.getUser(id);

    if (userModel != null) {
      return UserEntity(
        email: userModel.email,
        password: userModel.password,
      );
    } else {
      throw NotFoundLocalException();
    }
  }
}

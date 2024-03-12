import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user/user.entity.dart';
import '../../../../domain/repositories/auth/local/auth.local.repository.dart';
import '../../../datasources/auth/local/auth.local.datasource.dart';
import '../../../models/user/user.model.dart';
import '../../../utils/exceptions/local/not_found.exception.dart';

@LazySingleton(as: AuthLocalRepository)
class AuthLocalRepositoryImpl implements AuthLocalRepository {
  final AuthLocalDataSource authLocalDataSource;

  const AuthLocalRepositoryImpl({
    required this.authLocalDataSource,
  });

  @override
  Future<UserEntity> getUser({required String id}) async {
    UserModel? userModel = await authLocalDataSource.getUser(id);

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

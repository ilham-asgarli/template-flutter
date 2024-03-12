import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user/user.entity.dart';
import '../../../../domain/repositories/auth/remote/auth.remote.repository.dart';
import '../../../datasources/auth/remote/auth.remote.datasource.dart';
import '../../../models/user/user.model.dart';
import '../../../utils/exceptions/network/custom.exception.dart';

@LazySingleton(as: AuthRemoteRepository)
class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRemoteRepositoryImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<UserEntity> getUser({required String id}) async {
    try {
      UserModel userModel = await authRemoteDataSource.getUser(id);
      return UserEntity(
        email: userModel.email,
        password: userModel.password,
      );
    } on DioException catch (e) {
      throw e.error!;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}

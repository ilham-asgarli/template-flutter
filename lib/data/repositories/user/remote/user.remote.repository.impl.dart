import 'package:dio/dio.dart';

import '../../../../domain/entities/user.entity.dart';
import '../../../../domain/repositories/user/remote/user.remote.repository.dart';
import '../../../datasources/user/remote/user.remote.datasource.dart';
import '../../../models/user.model.dart';
import '../../../utils/exceptions/network/custom.exception.dart';

class UserRemoteRepositoryImpl implements UserRemoteRepository {
  final UserRemoteDataSource userRemoteDataSource;

  const UserRemoteRepositoryImpl({
    required this.userRemoteDataSource,
  });

  @override
  Future<UserEntity> getUser({required int id}) async {
    try {
      UserModel model = await userRemoteDataSource.getUser(id);
      return UserEntity.fromModel(model);
    } on DioException catch (e) {
      throw e.error!;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}

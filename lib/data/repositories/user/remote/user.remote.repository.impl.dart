import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/user/user.entity.dart';
import '../../../../domain/repositories/user/remote/user.remote.repository.dart';
import '../../../datasources/user/remote/user.remote.datasource.dart';
import '../../../models/user/user.model.dart';
import '../../../utils/exceptions/network/custom.exception.dart';

@LazySingleton(as: UserRemoteRepository)
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

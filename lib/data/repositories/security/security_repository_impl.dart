import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/network/custom_error.dart';
import '../../../domain/repositories/security/security_repository.dart';
import '../../data-sources/remote/security/security_remote_data_source.dart';
import '../../models/user_model.dart';

@LazySingleton(as: SecurityRepository)
class SecurityRepositoryImpl implements SecurityRepository {
  final SecurityRemoteDataSource securityRemoteDataSource;

  SecurityRepositoryImpl({
    required this.securityRemoteDataSource,
  });

  @override
  Future<UserModel> getUser(String id) async {
    try {
      UserModel userModel = await securityRemoteDataSource.getUser(id);
      return userModel;
    } on DioException catch (e) {
      throw e.error!;
    } catch (e) {
      throw CustomError();
    }
  }
}

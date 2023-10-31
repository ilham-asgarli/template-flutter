import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/repositories/security/remote/security.remote.repository.dart';
import '../../../datasources/security/remote/security_remote_data_source.dart';
import '../../../models/user_model.dart';
import '../../../utils/exceptions/network/custom.exception.dart';

@LazySingleton(as: SecurityRemoteRepository)
class SecurityRemoteRepositoryImpl implements SecurityRemoteRepository {
  final SecurityRemoteDataSource securityRemoteDataSource;

  const SecurityRemoteRepositoryImpl({
    required this.securityRemoteDataSource,
  });

  @override
  Future<UserModel> getUser({required String id}) async {
    try {
      UserModel userModel = await securityRemoteDataSource.getUser(id);
      return userModel;
    } on DioException catch (e) {
      throw e.error!;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}

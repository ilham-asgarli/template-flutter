import 'package:injectable/injectable.dart';

import '../../../../domain/repositories/security/local/security.local.repository.dart';
import '../../../datasources/security/local/security.local.datasource.dart';
import '../../../models/user_model.dart';
import '../../../utils/exceptions/local/not_found.exception.dart';

@LazySingleton(as: SecurityLocalRepository)
class SecurityLocalRepositoryImpl implements SecurityLocalRepository {
  final SecurityLocalDataSource securityLocalDataSource;

  SecurityLocalRepositoryImpl({
    required this.securityLocalDataSource,
  });

  @override
  Future<UserModel> getUser({required String id}) async {
    UserModel? userModel = await securityLocalDataSource.getUser(id);

    if (userModel != null) {
      return userModel;
    } else {
      throw NotFoundLocalException();
    }
  }
}

import '../../../../domain/entities/user.entity.dart';
import '../../../../domain/repositories/user/local/user.local.repository.dart';
import '../../../datasources/user/local/user.local.datasource.dart';
import '../../../models/user.model.dart';
import '../../../utils/exceptions/local/not_found.exception.dart';

class UserLocalRepositoryImpl implements UserLocalRepository {
  final UserLocalDataSource userLocalDataSource;

  const UserLocalRepositoryImpl({
    required this.userLocalDataSource,
  });

  @override
  Future<UserEntity> getUser({required int id}) async {
    UserModel? model = await userLocalDataSource.getUser(id);

    if (model != null) {
      return UserEntity.fromModel(model);
    } else {
      throw NotFoundLocalException();
    }
  }
}

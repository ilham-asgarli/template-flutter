import '../../../entities/user/user.entity.dart';

abstract class UserLocalRepository {
  Future<UserEntity> getUser({required int id});
}

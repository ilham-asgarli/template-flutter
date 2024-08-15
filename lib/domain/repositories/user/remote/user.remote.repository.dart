import '../../../entities/user/user.entity.dart';

abstract class UserRemoteRepository {
  Future<UserEntity> getUser({required int id});
}

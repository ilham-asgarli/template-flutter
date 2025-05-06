import '../../../entities/user.entity.dart';

abstract class UserRemoteRepository {
  Future<UserEntity> getUser({required int id});
}

import '../../../entities/user/user.entity.dart';

abstract class AuthRemoteRepository {
  Future<UserEntity> getUser({required String id});
}

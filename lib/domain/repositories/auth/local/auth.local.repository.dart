import '../../../entities/user/user.entity.dart';

abstract class AuthLocalRepository {
  Future<UserEntity> getUser({required String id});
}

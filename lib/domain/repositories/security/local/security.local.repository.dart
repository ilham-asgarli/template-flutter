import '../../../entities/user.entity.dart';

abstract class SecurityLocalRepository {
  Future<UserEntity> getUser({required String id});
}

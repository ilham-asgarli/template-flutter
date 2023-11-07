import '../../../entities/user_entity.dart';

abstract class SecurityLocalRepository {
  Future<UserEntity> getUser({required String id});
}

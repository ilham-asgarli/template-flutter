import '../../../entities/user_entity.dart';

abstract class SecurityRemoteRepository {
  Future<UserEntity> getUser({required String id});
}

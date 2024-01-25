import '../../../entities/user.entity.dart';

abstract class SecurityRemoteRepository {
  Future<UserEntity> getUser({required String id});
}

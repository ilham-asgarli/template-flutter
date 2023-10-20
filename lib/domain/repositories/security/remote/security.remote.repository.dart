import '../../../../data/models/user_model.dart';

abstract class SecurityRemoteRepository {
  Future<UserModel> getUser({required String id});
}

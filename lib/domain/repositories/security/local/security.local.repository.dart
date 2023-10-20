import '../../../../data/models/user_model.dart';

abstract class SecurityLocalRepository {
  Future<UserModel> getUser({required String id});
}

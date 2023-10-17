import '../../../data/models/user_model.dart';

abstract class SecurityRepository {
  Future<UserModel> getUser({required String id});
}

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../models/user/user.model.dart';

@LazySingleton()
class AuthLocalDataSource {
  final Isar isar;

  const AuthLocalDataSource({
    required this.isar,
  });

  Future<UserModel?> getUser(String id) async {
    UserModel? userModel = isar.userModels.where().idEqualTo(id).findFirst();
    return userModel;
  }
}

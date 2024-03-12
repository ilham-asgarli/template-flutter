import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../models/user/user.model.dart';

@LazySingleton()
class UserLocalDataSource {
  final Isar isar;

  const UserLocalDataSource({
    required this.isar,
  });

  Future<UserModel?> getUser(String id) async {
    UserModel? userModel = isar.userModels.where().idEqualTo(id).findFirst();
    return userModel;
  }
}

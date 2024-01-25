import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../models/user.model.dart';

@LazySingleton()
class SecurityLocalDataSource {
  final Isar isar;

  const SecurityLocalDataSource({
    required this.isar,
  });

  Future<UserModel?> getUser(String id) async {
    UserModel? userModel =
        await isar.userModels.filter().idEqualTo(id).findFirst();
    return userModel;
  }
}

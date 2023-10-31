import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../utils/constants/di/isar_constants.dart';
import '../../../models/user_model.dart';

@LazySingleton()
class SecurityLocalDataSource {
  final Isar isar;

  const SecurityLocalDataSource({
    @Named(IsarConstants.users) required this.isar,
  });

  Future<UserModel?> getUser(String id) async {
    UserModel? userModel =
        await isar.userModels.filter().idEqualTo(id).findFirst();
    return userModel;
  }
}

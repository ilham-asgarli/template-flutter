import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../models/user/user.model.dart';
import '../../../utils/constants/db/db_constants.dart';
import '../../../utils/exceptions/local/not_found.exception.dart';

@LazySingleton()
class UserLocalDataSource {
  final Database db;

  const UserLocalDataSource({required this.db});

  Future<UserModel> getUser(int id) async {
    List<Map<String, Object?>> user = await db.query(
      DbConstants.users,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (user.isNotEmpty) {
      UserModel? userModel = UserModel.fromJson(user.first);
      return userModel;
    } else {
      throw NotFoundLocalException();
    }
  }

  Future<void> setUser(UserModel userModel) async {
    var users = await db.query(
      DbConstants.users,
      where: 'id = ?',
      whereArgs: [userModel.id],
    );

    if (users.isNotEmpty) {
      await db.update(
        DbConstants.users,
        userModel.toJson(),
        where: 'id = ?',
        whereArgs: [userModel.id],
      );
    } else {
      await db.insert(DbConstants.users, userModel.toJson());
    }
  }
}

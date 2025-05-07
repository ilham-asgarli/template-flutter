import 'package:sqflite/sqflite.dart';

import '../../constants/local/db_constants.dart';

class InitDb {
  final Database db;

  const InitDb({required this.db});

  Future<void> createUsers() async {
    var createSql = '''
      CREATE TABLE IF NOT EXISTS ${DbConstants.users} (
        id TEXT PRIMARY KEY,
        email TEXT,
        avatar TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''';
    await db.execute(createSql);
  }
}

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarManager {
  static IsarManager get instance {
    _instance ??= IsarManager._init();
    return _instance!;
  }

  static IsarManager? _instance;
  IsarManager._init();

  Future<Isar> openSchema(CollectionSchema<dynamic> schema) async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [schema],
      directory: dir.path,
    );

    return isar;
  }

  Future<Isar> openSchemas(List<CollectionSchema<dynamic>> schemas) async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      schemas,
      directory: dir.path,
    );

    return isar;
  }
}

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._init();

  static HiveManager get instance => _instance;

  HiveManager._init();

  Future<Box> openHiveBox(String boxName) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }

    return await Hive.openBox(boxName);
  }
}

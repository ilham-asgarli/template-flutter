import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._init();

  SharedPreferences? _preferences;

  static SharedPreferencesManager get instance => _instance;

  SharedPreferencesManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences?.clear();
  }

  Future<void> clearAllSaveFirst() async {
    if (_preferences != null) {
      await _preferences?.clear();
    }
  }

  Future<void> setStringValue(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  Future<void> setBoolValue(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  String? getStringValue(String key) => _preferences?.getString(key);

  bool? getBoolValue(String key) => _preferences?.getBool(key);
}

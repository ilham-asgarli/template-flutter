import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferencesManager._init();

  static final SharedPreferencesManager instance =
      SharedPreferencesManager._init();

  SharedPreferences? preferences;

  static Future preferencesInit() async {
    instance.preferences ??= await SharedPreferences.getInstance();
  }
}

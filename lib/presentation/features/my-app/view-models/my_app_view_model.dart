import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view-models/base_view_model.dart';
import '../../../../utils/app/constants/cache/hive_constants.dart';
import '../../../../utils/app/constants/navigation/navigation_constants.dart';
import '../../../../utils/app/constants/cache/shared_preferences_constants.dart';
import '../../../../utils/app/notifiers/theme_notifier.dart';

class MyAppViewModel with BaseViewModel {
  @override
  void init(context) async {
    super.init(context);
    //await setTheme(context);
    FlutterNativeSplash.remove();
  }

  String getInitialRoute() {
    /*String? accessToken = hiveBox.get(HiveConstants.accessToken);

    if (accessToken == null) {
      return NavigationConstants.LOGIN;
    } else {
      return NavigationConstants.HOME;
    }*/

    return NavigationConstants.HOME;
  }

  /*setTheme(context) async {
    ThemeNotifier themeNotifier = Provider.of(context);
    bool? isDarkMode = sharedPreferencesManager.getBoolValue(
      SharedPreferencesConstants.isDarkMode,
    );
    ThemeMode? themeMode = isDarkMode == null
        ? null
        : isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light;
    themeNotifier.setThemeMode(themeMode);
  }*/
}

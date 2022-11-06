import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../../../ui/config/theme/common/common_theme.dart';

import '../../../../core/cache/shared_preferences_manager.dart';
import '../../../ui/config/theme/custom/main_theme.dart';
import '../../../ui/config/theme/interfaces/custom_theme.dart';
import '../../../ui/constants/enums/app_theme_enum.dart';
import '../../constants/cache/shared_preferences_constants.dart';

class ThemeHelper {
  static final ThemeHelper instance = ThemeHelper._init();

  ThemeHelper._init();

  ThemeMode getSystemThemeMode() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  ThemeMode? getThemeModePreference() {
    bool? isDarkMode = SharedPreferencesManager.instance.preferences
        ?.getBool(SharedPreferencesConstants.isDarkMode);

    return isDarkMode == null
        ? null
        : isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  CustomTheme getCustomTheme(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.main:
        return MainTheme.instance;
    }
  }

  ThemeData getThemeDataWithThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        return ThemeData();
      case ThemeMode.light:
        return ThemeData.light();
      case ThemeMode.dark:
        return ThemeData.dark();
    }
  }

  void setSystemUIOverlayStyle(SystemUiOverlayStyle systemUiOverlayStyle) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  void setSystemUIOverlayStyleWithAppTheme(AppTheme? appTheme) {
    setSystemUIOverlayStyle(
      appTheme == null
          ? CommonTheme.instance.systemUiOverlayStyle()
          : getCustomTheme(appTheme).systemUiOverlayStyle(),
    );
  }

  void setEnabledSystemUIMode(SystemUiMode systemUiMode) {
    SystemChrome.setEnabledSystemUIMode(systemUiMode);
  }
}

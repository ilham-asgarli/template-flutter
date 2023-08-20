import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../../ui/config/theme/implementations/dark/dark_theme.dart';
import '../../../ui/config/theme/implementations/light/light_theme.dart';
import '../../../ui/config/theme/interfaces/custom_theme.dart';
import '../../../ui/constants/enums/app_theme_enum.dart';

class ThemeHelper {
  static ThemeHelper get instance {
    _instance ??= ThemeHelper._init();
    return _instance!;
  }

  static ThemeHelper? _instance;

  ThemeHelper._init();

  ThemeMode getSystemThemeMode() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  CustomTheme getCustomTheme(AppTheme? appTheme, ThemeMode themeMode) {
    switch (appTheme) {
      case AppTheme.light:
        return LightTheme.instance;
      case AppTheme.dark:
        return DarkTheme.instance;
      default:
        if (themeMode == ThemeMode.light) {
          return LightTheme.instance;
        } else if (themeMode == ThemeMode.dark) {
          return DarkTheme.instance;
        }

        return getSystemThemeMode() == ThemeMode.light
            ? LightTheme.instance
            : DarkTheme.instance;
    }
  }

  void setSystemUIOverlayStyle(SystemUiOverlayStyle systemUiOverlayStyle) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  void setSystemUIOverlayStyleWithAppTheme(
      AppTheme? appTheme, ThemeMode themeMode) {
    setSystemUIOverlayStyle(
      getCustomTheme(appTheme, themeMode).systemUiOverlayStyle(),
    );
  }

  void setEnabledSystemUIMode(SystemUiMode systemUiMode) {
    SystemChrome.setEnabledSystemUIMode(systemUiMode);
  }
}

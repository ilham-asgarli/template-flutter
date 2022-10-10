import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../constants/colors/app_colors.dart';
import '../constants/enums/app_theme_enum.dart';
import '../../../utils/app/config/theme/common_theme.dart';
import '../../../utils/app/config/theme/dark_theme.dart';
import '../../../utils/app/config/theme/light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData themeData = CommonTheme.instance.getTheme(
    CustomLightTheme.instance.getLightTheme(),
  );
  AppThemes appThemeEnum = AppThemes.LIGHT;
  ThemeMode themeMode = ThemeMode.system;
  bool isDarkMode = false;

  setThemeMode(ThemeMode? themeMode) {
    this.themeMode = themeMode ?? getSystemThemeMode();
    isDarkMode = this.themeMode == ThemeMode.dark;
    setSystemUIOverlayStyle(this.themeMode);
  }

  getSystemThemeMode() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  changeThemeMode(ThemeMode? themeMode) {
    setThemeMode(themeMode);
    notifyListeners();
  }

  void changeThemeValue(AppThemes theme) {
    if (theme == AppThemes.DARK) {
      themeData = CommonTheme.instance
          .getTheme(CustomDarkTheme.instance.getDarkTheme());
      appThemeEnum = AppThemes.DARK;
      changeThemeMode(ThemeMode.dark);
    } else {
      themeData = CommonTheme.instance
          .getTheme(CustomLightTheme.instance.getLightTheme());
      appThemeEnum = AppThemes.LIGHT;
      changeThemeMode(ThemeMode.light);
    }
    notifyListeners();
  }

  /// Toggle your app theme dark or light.
  ThemeMode changeTheme() {
    if (themeMode == ThemeMode.light) {
      changeThemeValue(AppThemes.DARK);
    } else {
      changeThemeValue(AppThemes.LIGHT);
    }
    notifyListeners();
    return themeMode;
  }

  SystemUiOverlayStyle systemUiOverlayStyle(ThemeMode currentMode) {
    return SystemUiOverlayStyle(
      // status bar color
      statusBarColor: AppColors.mainColor,
      // status bar brightness
      statusBarBrightness: Brightness.light,
      // status barIcon Brightness
      statusBarIconBrightness: Brightness.light,
      // navigation bar color
      systemNavigationBarColor: currentMode == ThemeMode.light
          ? AppColors.light
          : currentMode == ThemeMode.dark
              ? AppColors.dark
              : null,
      // navigation bar icon
      systemNavigationBarIconBrightness: currentMode == ThemeMode.light
          ? Brightness.dark
          : currentMode == ThemeMode.dark
              ? Brightness.light
              : null,
      // navigation bar divider color
      systemNavigationBarDividerColor: currentMode == ThemeMode.light
          ? AppColors.light
          : currentMode == ThemeMode.dark
              ? AppColors.dark
              : null,
    );
  }

  void setSystemUIOverlayStyle(ThemeMode currentMode) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle(currentMode));
  }
}

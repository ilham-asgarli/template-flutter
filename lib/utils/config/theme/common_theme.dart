import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../../core/init/cache/shared_preferences_manager.dart';
import '../../logic/constants/cache/shared_preferences_constants.dart';
import '../../ui/constants/colors/app_colors.dart';

class CommonTheme {
  static final CommonTheme _instance = CommonTheme._init();

  static CommonTheme get instance => _instance;

  CommonTheme._init();

  ThemeData getTheme({
    required ThemeData customThemeData,
  }) {
    return customThemeData.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeMode getSystemThemeMode() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  ThemeMode? getThemeModePreference() {
    bool? isDarkMode = SharedPreferencesManager.instance.getBoolValue(
      SharedPreferencesConstants.isDarkMode,
    );

    return isDarkMode == null
        ? null
        : isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  SystemUiOverlayStyle systemUiOverlayStyle() {
    return const SystemUiOverlayStyle(
      // status bar color
      statusBarColor: AppColors.mainColor,
      // status bar brightness
      statusBarBrightness: Brightness.light,
      // status barIcon Brightness
      statusBarIconBrightness: Brightness.light,
      // navigation bar color
      systemNavigationBarColor: null,
      // navigation bar icon
      systemNavigationBarIconBrightness: null,
      // navigation bar divider color
      systemNavigationBarDividerColor: null,
    );
  }

  void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      systemUiOverlayStyle(),
    );
  }
}

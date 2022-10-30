import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../core/init/cache/shared_preferences_manager.dart';
import '../../logic/constants/cache/shared_preferences_constants.dart';
import '../../ui/constants/colors/app_colors.dart';

class CommonTheme {
  static final CommonTheme _instance = CommonTheme._init();

  static CommonTheme get instance => _instance;

  CommonTheme._init();

  ThemeData getTheme(ThemeData theme) {
    return theme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.mainColor,
      ),
    );
  }

  ThemeMode getSystemThemeMode() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  ThemeMode? getThemeMode() {
    bool? isDarkMode = SharedPreferencesManager.instance.getBoolValue(
      SharedPreferencesConstants.isDarkMode,
    );

    return isDarkMode == null
        ? null
        : isDarkMode
        ? ThemeMode.dark
        : ThemeMode.light;
  }

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../../ui/config/theme/implementations/main/main_theme.dart';
import '../../../ui/config/theme/interfaces/theme_interface.dart';
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

  ThemeInterface getCustomTheme(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.main:
        return MainTheme.instance;
      default:
        return MainTheme.instance;
    }
  }

  void setSystemUIOverlayStyleWithAppTheme(AppTheme appTheme) {
    setSystemUIOverlayStyle(getCustomTheme(appTheme).systemUiOverlayStyle());
  }

  void setSystemUIOverlayStyle(SystemUiOverlayStyle systemUiOverlayStyle) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  void setEnabledSystemUIMode(SystemUiMode systemUiMode) {
    SystemChrome.setEnabledSystemUIMode(systemUiMode);
  }
}

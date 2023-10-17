import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../config/theme/exapmle_theme.dart';
import '../../config/theme/main_theme.dart';
import '../../config/theme/theme_interface.dart';
import '../../constants/enums/app_theme_enum.dart';
import '../../di/injectable.dart';

@Singleton()
class ThemeHelper {
  ThemeMode getSystemThemeMode() {
    Brightness brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  ThemeInterface getCustomTheme(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.main:
        return getIt<MainTheme>();
      case AppTheme.example:
        return getIt<ExampleTheme>();
      default:
        return getIt<MainTheme>();
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

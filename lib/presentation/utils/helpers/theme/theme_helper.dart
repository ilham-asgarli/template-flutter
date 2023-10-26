import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/di/injectable.dart';
import '../../config/theme/exapmle_theme.dart';
import '../../config/theme/main_theme.dart';
import '../../config/theme/theme_interface.dart';
import '../../constants/enums/app_theme_enum.dart';

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
        return getIt<ThemeInterface>(instanceName: (MainTheme).toString());
      case AppTheme.example:
        return getIt<ThemeInterface>(instanceName: (ExampleTheme).toString());
      default:
        return getIt<ThemeInterface>(instanceName: (MainTheme).toString());
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

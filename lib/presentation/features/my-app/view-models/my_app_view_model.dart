import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../core/base/view-models/base_view_model.dart';
import '../../../../utils/app/bloc/theme/theme_bloc.dart';
import '../../../../utils/app/constants/colors/app_colors.dart';
import '../../../../utils/app/constants/navigation/navigation_constants.dart';
import '../../../../utils/app/constants/cache/shared_preferences_constants.dart';

class MyAppViewModel with BaseViewModel {
  ThemeMode? themeMode;
  bool? isDarkMode;

  @override
  void init(context) async {
    super.init(context);
    setTheme(context);
    BlocProvider.of<ThemeBloc>(context).add(
      ChangeTheme(
        themeMode: themeMode,
        isDarkMode: isDarkMode,
      ),
    );
    FlutterNativeSplash.remove();
  }

  String getInitialRoute() {
    return NavigationConstants.HOME;
  }

  setTheme(context) async {
    isDarkMode = sharedPreferencesManager.getBoolValue(
      SharedPreferencesConstants.isDarkMode,
    );
    themeMode = isDarkMode == null
        ? null
        : isDarkMode!
            ? ThemeMode.dark
            : ThemeMode.light;
    setThemeMode(themeMode);
  }

  getSystemThemeMode() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  setThemeMode(ThemeMode? themeMode) {
    this.themeMode = themeMode ?? getSystemThemeMode();
    isDarkMode = this.themeMode == ThemeMode.dark;
    setSystemUIOverlayStyle(this.themeMode);
  }

  SystemUiOverlayStyle systemUiOverlayStyle(ThemeMode? currentMode) {
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

  void setSystemUIOverlayStyle(ThemeMode? currentMode) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle(currentMode));
  }
}

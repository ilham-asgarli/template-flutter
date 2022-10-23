import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:template/utils/app/config/theme/common_theme.dart';

import '../../../../core/base/view-models/base_view_model.dart';
import '../../../../utils/app/bloc/theme/theme_bloc.dart';
import '../../../../utils/app/config/theme/dark_theme.dart';
import '../../../../utils/app/config/theme/light_theme.dart';
import '../../../../utils/app/constants/cache/shared_preferences_constants.dart';
import '../../../../utils/app/constants/colors/app_colors.dart';
import '../../../../utils/app/constants/enums/app_theme_enum.dart';
import '../../../../utils/app/constants/router/router_constants.dart';

class MyAppViewModel with BaseViewModel {
  ThemeMode? themeMode;
  bool? isDarkMode;
  ThemeData? themeData;
  AppTheme? appTheme;

  @override
  void init(context) async {
    super.init(context);

    setTheme(context);

    BlocProvider.of<ThemeBloc>(context).add(
      ChangeTheme(
        themeMode: themeMode,
        isDarkMode: isDarkMode,
        appTheme: appTheme,
        themeData: themeData,
      ),
    );

    FlutterNativeSplash.remove();
  }

  String getInitialRoute() {
    return RouterConstants.HOME;
  }

  setTheme(context) async {
    isDarkMode = sharedPreferencesManager.getBoolValue(
      SharedPreferencesConstants.isDarkMode,
    );

    appTheme = isDarkMode == null
        ? null
        : isDarkMode!
            ? AppTheme.DARK
            : AppTheme.LIGHT;

    changeTheme(appTheme);
  }

  void changeTheme(AppTheme? theme) {
    if (theme == AppTheme.DARK) {
      themeData = CommonTheme.instance
          .getTheme(CustomDarkTheme.instance.getDarkTheme());
      appTheme = AppTheme.DARK;
      setThemeMode(ThemeMode.dark);
    } else if (theme == AppTheme.LIGHT) {
      themeData = CommonTheme.instance
          .getTheme(CustomLightTheme.instance.getLightTheme());
      appTheme = AppTheme.LIGHT;
      setThemeMode(ThemeMode.light);
    }

    setSystemUIOverlayStyle(theme);
  }

  setThemeMode(ThemeMode? themeMode) {
    this.themeMode = themeMode ?? getSystemThemeMode();
    isDarkMode = this.themeMode == ThemeMode.dark;
  }

  getSystemThemeMode() {
    Brightness brightness = SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  SystemUiOverlayStyle systemUiOverlayStyle(AppTheme? theme) {
    return SystemUiOverlayStyle(
      // status bar color
      statusBarColor: AppColors.mainColor,
      // status bar brightness
      statusBarBrightness: Brightness.light,
      // status barIcon Brightness
      statusBarIconBrightness: Brightness.light,
      // navigation bar color
      systemNavigationBarColor: theme == AppTheme.LIGHT
          ? AppColors.light
          : theme == AppTheme.DARK
              ? AppColors.dark
              : null,
      // navigation bar icon
      systemNavigationBarIconBrightness: theme == AppTheme.LIGHT
          ? Brightness.dark
          : theme == AppTheme.DARK
              ? Brightness.light
              : null,
      // navigation bar divider color
      systemNavigationBarDividerColor: theme == AppTheme.LIGHT
          ? AppColors.light
          : theme == AppTheme.DARK
              ? AppColors.dark
              : null,
    );
  }

  void setSystemUIOverlayStyle(AppTheme? theme) {
    SystemChrome.setSystemUIOverlayStyle(
      systemUiOverlayStyle(
        theme,
      ),
    );
  }
}

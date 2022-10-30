import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../ui/constants/colors/app_colors.dart';

class MainTheme {
  static final MainTheme _instance = MainTheme._init();

  static MainTheme get instance => _instance;

  MainTheme._init();

  ThemeData getTheme({
    required ThemeData modeThemeData,
  }) {
    return modeThemeData.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.mainColor,
      ),
    );
  }

  SystemUiOverlayStyle systemUiOverlayStyle() {
    return SystemUiOverlayStyle(
      // status bar color
      statusBarColor: AppColors.mainColor,
      // status bar brightness
      statusBarBrightness: Brightness.light,
      // status barIcon Brightness
      statusBarIconBrightness: Brightness.light,
      // navigation bar color
      systemNavigationBarColor: AppColors.dark,
      // navigation bar icon
      systemNavigationBarIconBrightness: Brightness.light,
      // navigation bar divider color
      systemNavigationBarDividerColor: AppColors.light,
    );
  }
}

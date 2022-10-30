import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../ui/constants/colors/app_colors.dart';

class SecondTheme {
  static final SecondTheme _instance = SecondTheme._init();

  static SecondTheme get instance => _instance;

  SecondTheme._init();

  ThemeData getTheme({
    required ThemeData modeThemeData,
  }) {
    return modeThemeData.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
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

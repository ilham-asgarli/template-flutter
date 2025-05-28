import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/typography/app_typograpy.dart';
import '../../extensions/custom_color_extension.dart';
import '../../extensions/custom_text_theme_extension.dart';
import 'theme_interface.dart';

class ExampleTheme extends ThemeInterface {
  @override
  ThemeData getTheme(themeMode) {
    final brightness =
        themeMode == ThemeMode.light ? Brightness.light : Brightness.dark;
    final colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: AppColors.red,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: colorScheme,
      textTheme: TextTheme(
        bodyMedium: AppTypography.bodyMedium.copyWith(
          fontSize: 10,
        ),
      ),
      extensions: [
        const CustomColorExtension(
          primary: AppColors.red,
        ),
        CustomTextThemeExtension(
          example: AppTypography.example.copyWith(
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  @override
  SystemUiOverlayStyle systemUiOverlayStyle(ThemeMode themeMode) {
    return const SystemUiOverlayStyle(
      statusBarColor: AppColors.red,
      systemNavigationBarColor: AppColors.red,
    );
  }
}

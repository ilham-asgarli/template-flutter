import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app/presentation_constants.dart';
import '../../constants/colors/app_colors.dart';
import '../../constants/typography/app_typograpy.dart';
import '../../extensions/custom_color_extension.dart';
import '../../extensions/custom_text_theme_extension.dart';
import 'theme_interface.dart';

class MainTheme extends ThemeInterface {
  @override
  ThemeData getTheme(themeMode) {
    final brightness =
        themeMode == ThemeMode.light ? Brightness.light : Brightness.dark;
    final colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: AppColors.blue,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: colorScheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: AppTypography.bodyMedium,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(PresentationConstants.borderRadius),
        ),
        contentPadding: const EdgeInsets.all(12),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSecondaryContainer,
          elevation: 0,
          padding: const EdgeInsets.all(12),
        ),
      ),
      extensions: const [
        CustomColorExtension(
          primary: AppColors.blue,
        ),
        CustomTextThemeExtension(
          example: AppTypography.example,
        ),
      ],
    );
  }

  @override
  SystemUiOverlayStyle systemUiOverlayStyle(ThemeMode themeMode) {
    return const SystemUiOverlayStyle(
      statusBarColor: AppColors.blue,
      systemNavigationBarColor: AppColors.blue,
    );
  }
}

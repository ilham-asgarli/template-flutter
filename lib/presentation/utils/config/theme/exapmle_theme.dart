import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../constants/colors/app_colors.dart';
import '../../constants/typography/app_typograpy.dart';
import '../../extensions/custom_color_extension.dart';
import '../../extensions/custom_text_theme_extension.dart';
import 'theme_interface.dart';

@LazySingleton()
class ExampleTheme extends ThemeInterface {
  @override
  ThemeData getTheme(themeMode) {
    return ThemeData(
      useMaterial3: true,
      brightness:
          themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorSchemeSeed: AppColors.red,
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
  SystemUiOverlayStyle systemUiOverlayStyle() {
    return const SystemUiOverlayStyle(
      statusBarColor: AppColors.red,
      systemNavigationBarColor: AppColors.red,
    );
  }
}

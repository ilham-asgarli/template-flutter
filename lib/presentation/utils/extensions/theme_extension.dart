import 'package:flutter/material.dart';

import 'custom_color_extension.dart';
import 'custom_text_theme_extension.dart';

extension AppThemeExtension on ThemeData {
  CustomColorExtension get customColors => extension<CustomColorExtension>()!;

  CustomTextThemeExtension get customTextTheme =>
      extension<CustomTextThemeExtension>()!;
}

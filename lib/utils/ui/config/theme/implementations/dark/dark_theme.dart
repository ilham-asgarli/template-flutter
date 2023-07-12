import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../interfaces/custom_theme.dart';

class DarkTheme extends CustomTheme {
  static DarkTheme get instance {
    _instance ??= DarkTheme._init();
    return _instance!;
  }

  static DarkTheme? _instance;
  DarkTheme._init();

  @override
  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorSchemeSeed: Colors.green,
    );
  }

  @override
  SystemUiOverlayStyle systemUiOverlayStyle() {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.green,
      systemNavigationBarColor: Colors.green,
    );
  }
}

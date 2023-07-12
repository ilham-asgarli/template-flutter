import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../interfaces/custom_theme.dart';

class LightTheme extends CustomTheme {
  static LightTheme get instance {
    _instance ??= LightTheme._init();
    return _instance!;
  }

  static LightTheme? _instance;
  LightTheme._init();

  @override
  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorSchemeSeed: Colors.blue,
    );
  }

  @override
  SystemUiOverlayStyle systemUiOverlayStyle() {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      systemNavigationBarColor: Colors.blue,
    );
  }
}

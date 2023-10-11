import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../interfaces/theme_interface.dart';

class MainTheme extends ThemeInterface {
  static MainTheme get instance {
    _instance ??= MainTheme._init();
    return _instance!;
  }

  static MainTheme? _instance;
  MainTheme._init();

  @override
  ThemeData getTheme(themeMode) {
    return ThemeData(
      brightness:
          themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
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

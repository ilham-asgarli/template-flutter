import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'theme_interface.dart';

@LazySingleton()
class MainTheme extends ThemeInterface {
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeInterface {
  ThemeData getTheme(ThemeMode themeMode);
  SystemUiOverlayStyle systemUiOverlayStyle();
}

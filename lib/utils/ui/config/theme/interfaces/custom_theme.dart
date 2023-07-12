import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CustomTheme {
  ThemeData getTheme();
  SystemUiOverlayStyle systemUiOverlayStyle();
}

import 'package:flutter/material.dart';

class CustomLightTheme {
  static final CustomLightTheme _instance = CustomLightTheme._init();
  static CustomLightTheme get instance => _instance;

  CustomLightTheme._init();

  ThemeData getLightTheme() {
    return ThemeData.light();
  }
}
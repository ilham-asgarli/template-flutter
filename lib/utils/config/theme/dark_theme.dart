import 'package:flutter/material.dart';

class CustomDarkTheme {
  static final CustomDarkTheme _instance = CustomDarkTheme._init();
  static CustomDarkTheme get instance => _instance;

  CustomDarkTheme._init();

  ThemeData getDarkTheme() {
    return ThemeData.dark();
  }
}
import 'package:flutter/material.dart';

abstract class AppColors {
  // Red
  static const red = Colors.red;
  static const imperialRed = Color(0xFFE54B4B);

  // White
  static const seashell = Color(0xFFF7EBE8);

  // Grey
  static const black = _BlackColors();
}

class _BlackColors {
  const _BlackColors();

  final shade0 = const Color(0xFF000000);
  final shade1 = const Color(0xFF0d0d0d);
}

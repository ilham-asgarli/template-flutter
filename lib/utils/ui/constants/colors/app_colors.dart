import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColor = Colors.blue;
  static const Color secondColor = Colors.white;

  static const Color light = Colors.white;
  static Color dark = Colors.grey[850]!;

  static const Color shimmerColor = mainColor;
  static Color shimmerBaseColor = mainColor.withAlpha(100);
  static Color shimmerHighLightColor = mainColor.withAlpha(50);

  static Color defaultShimmerBaseColor = Colors.grey[300]!;
  static Color defaultShimmerHighLightColor = Colors.grey[100]!;
}

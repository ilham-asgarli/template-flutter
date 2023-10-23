import 'package:flutter/material.dart';

class CustomTextThemeExtension
    extends ThemeExtension<CustomTextThemeExtension> {
  final TextStyle example;

  const CustomTextThemeExtension({
    required this.example,
  });

  @override
  ThemeExtension<CustomTextThemeExtension> copyWith({
    TextStyle? example,
  }) {
    return CustomTextThemeExtension(
      example: example ?? this.example,
    );
  }

  @override
  ThemeExtension<CustomTextThemeExtension> lerp(
    covariant ThemeExtension<CustomTextThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomTextThemeExtension) {
      return this;
    }

    return CustomTextThemeExtension(
      example: TextStyle.lerp(example, other.example, t)!,
    );
  }
}

import 'package:flutter/material.dart';

class CustomColorExtension extends ThemeExtension<CustomColorExtension> {
  final Color primary;

  const CustomColorExtension({
    required this.primary,
  });

  @override
  ThemeExtension<CustomColorExtension> copyWith({
    Color? primary,
  }) {
    return CustomColorExtension(
      primary: primary ?? this.primary,
    );
  }

  @override
  ThemeExtension<CustomColorExtension> lerp(
    covariant ThemeExtension<CustomColorExtension>? other,
    double t,
  ) {
    if (other is! CustomColorExtension) {
      return this;
    }

    return CustomColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
    );
  }
}

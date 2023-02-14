import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/enums/app_enum.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get minProperty => min<double>(width, height);

  SizeProperty get minSizeProperty =>
      width == minProperty ? SizeProperty.width : SizeProperty.height;

  double get lowValue => height * 0.01;

  double get normalValue => height * 0.02;

  double get mediumValue => height * 0.04;

  double get highValue => height * 0.1;

  double dynamicWidth(double val) => width * val;

  double dynamicHeight(double val) => height * val;

  double dynamicMinProperty(double val) => min<double>(width, height) * val;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);

  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);

  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);

  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);

  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);

  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);

  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);

  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);

  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);

  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension ColorExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);

  Duration get normalDuration => const Duration(seconds: 1);
}

extension SpaceExtension on BuildContext {
  Widget dynamicVerticalSpace(double val) => SizedBox(
        height: dynamicHeight(val),
      );

  Widget dynamicHorizontalSpace(double val) => SizedBox(
        width: dynamicWidth(val),
      );

  Widget dynamicMinSizePropertySpace(double val) => SizedBox(
        width: minSizeProperty == SizeProperty.width ? val : 0,
        height: minSizeProperty == SizeProperty.height ? val : 0,
      );
}

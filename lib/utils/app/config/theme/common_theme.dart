import 'package:flutter/material.dart';

import '../../../../utils/app/constants/colors/app_colors.dart';

class CommonTheme {
  static final CommonTheme _instance = CommonTheme._init();

  static CommonTheme get instance => _instance;

  CommonTheme._init();

  ThemeData getTheme(ThemeData theme) {
    return theme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      //textTheme: Typography.tall2021.apply(fontSizeFactor: 1.sp),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.mainColor,
      ),
    );
  }
}

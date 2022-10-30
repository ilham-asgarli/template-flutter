import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../core/base/view-models/base_view_model.dart';
import '../../../../utils/logic/constants/cache/shared_preferences_constants.dart';
import '../../../../utils/logic/state/bloc/theme/theme_bloc.dart';
import '../../../../utils/ui/constants/colors/app_colors.dart';
import '../../../../utils/logic/constants/enums/app_theme_enum.dart';
import '../../../../utils/logic/constants/router/router_constants.dart';

class MyAppViewModel with BaseViewModel {
  void removeSplashScreen() {
    FlutterNativeSplash.remove();
  }

  String getInitialRoute() {
    return RouterConstants.HOME;
  }

  SystemUiOverlayStyle systemUiOverlayStyle(AppTheme? theme) {
    return SystemUiOverlayStyle(
      // status bar color
      statusBarColor: AppColors.mainColor,
      // status bar brightness
      statusBarBrightness: Brightness.light,
      // status barIcon Brightness
      statusBarIconBrightness: Brightness.light,
      // navigation bar color
      systemNavigationBarColor: theme == AppTheme.LIGHT
          ? AppColors.light
          : theme == AppTheme.DARK
              ? AppColors.dark
              : null,
      // navigation bar icon
      systemNavigationBarIconBrightness: theme == AppTheme.LIGHT
          ? Brightness.dark
          : theme == AppTheme.DARK
              ? Brightness.light
              : null,
      // navigation bar divider color
      systemNavigationBarDividerColor: theme == AppTheme.LIGHT
          ? AppColors.light
          : theme == AppTheme.DARK
              ? AppColors.dark
              : null,
    );
  }

  void setSystemUIOverlayStyle(AppTheme? theme) {
    SystemChrome.setSystemUIOverlayStyle(
      systemUiOverlayStyle(
        theme,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../utils/di/app_di.dart';
import '../../../utils/constants/enums/app_theme_enum.dart';
import '../../../utils/helpers/theme/theme_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState()) {
    getIt<ThemeHelper>().setSystemUIOverlayStyleWithAppTheme(
      state.appTheme,
    );
  }

  void changeTheme(AppTheme appTheme) {
    getIt<ThemeHelper>().setSystemUIOverlayStyleWithAppTheme(
      appTheme,
    );

    emit(state.copyWith(
      appTheme: appTheme,
    ));
  }

  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(
      themeMode: themeMode,
    ));
  }

  void toggleTheme() {
    var theme = switch (state.appTheme) {
      AppTheme.main => AppTheme.example,
      AppTheme.example => AppTheme.main,
    };

    changeTheme(theme);
  }

  void toggleThemeMode() {
    var mode = switch (state.themeMode) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };

    changeThemeMode(mode);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}

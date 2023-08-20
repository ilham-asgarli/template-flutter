import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../ui/constants/enums/app_theme_enum.dart';
import '../../../helpers/theme/theme_helper.dart';

part 'theme_cubit.freezed.dart';
part 'theme_cubit.g.dart';
part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState()) {
    ThemeHelper.instance.setSystemUIOverlayStyleWithAppTheme(
      state.appTheme,
      state.themeMode,
    );
  }

  changeTheme(AppTheme? appTheme) {
    ThemeHelper.instance.setSystemUIOverlayStyleWithAppTheme(
      appTheme,
      state.themeMode,
    );

    emit(state.copyWith(
      appTheme: appTheme,
    ));
  }

  changeThemeMode(ThemeMode themeMode) {
    ThemeHelper.instance.setSystemUIOverlayStyleWithAppTheme(
      state.appTheme,
      themeMode,
    );

    emit(state.copyWith(
      themeMode: themeMode,
    ));
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

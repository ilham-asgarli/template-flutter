import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../../../utils/constants/enums/app_theme_enum.dart';
import '../../../../../../utils/helpers/theme/theme_helper.dart';

part 'theme_cubit.freezed.dart';
part 'theme_cubit.g.dart';
part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState()) {
    ThemeHelper.instance.setSystemUIOverlayStyleWithAppTheme(
      state.appTheme,
    );
  }

  changeTheme(AppTheme appTheme) {
    ThemeHelper.instance.setSystemUIOverlayStyleWithAppTheme(
      appTheme,
    );

    emit(state.copyWith(
      appTheme: appTheme,
    ));
  }

  changeThemeMode(ThemeMode themeMode) {
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

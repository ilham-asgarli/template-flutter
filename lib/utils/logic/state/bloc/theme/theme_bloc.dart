import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:template/core/extensions/string_extension.dart';
import 'package:template/utils/config/theme/common_theme.dart';

import '../../../../../core/init/cache/shared_preferences_manager.dart';
import '../../../constants/cache/shared_preferences_constants.dart';
import '../../../constants/enums/app_theme_enum.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            themeMode: CommonTheme.instance.getSystemThemeMode(),
          ),
        ) {
    on<ChangeTheme>(_onChangeTheme);
  }

  _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    emit(
      ThemeState(
        appTheme: event.appTheme,
        themeMode: event.themeMode,
      ),
    );
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.appTheme != null ? state.toMap() : null;
  }
}

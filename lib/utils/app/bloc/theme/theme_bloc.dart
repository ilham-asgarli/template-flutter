import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeChanged()) {
    on<ThemeEvent>((event, emit) {
      add(const ChangeTheme());
    });
    on<ChangeTheme>(_onChangeTheme);
  }

  _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    emit(
      ThemeChanged(
        appThemeEnum: event.appThemeEnum,
        themeData: event.themeData,
        themeMode: event.themeMode,
        isDarkMode: event.isDarkMode,
      ),
    );
  }
}

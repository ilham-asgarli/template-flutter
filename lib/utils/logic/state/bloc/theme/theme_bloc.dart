import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/common_theme.dart';
import '../../../config/theme/light_theme.dart';
import '../../../constants/enums/app_theme_enum.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeInitial()) {
    on<ChangeTheme>(_onChangeTheme);
  }

  _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    emit(
      ThemeChanged(
        appTheme: event.appTheme ?? AppTheme.LIGHT,
        themeData: event.themeData ??
            CommonTheme.instance.getTheme(
              CustomLightTheme.instance.getLightTheme(),
            ),
        themeMode: event.themeMode ?? ThemeMode.light,
        isDarkMode: event.isDarkMode ?? false,
      ),
    );
  }
}

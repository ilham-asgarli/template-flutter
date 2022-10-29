part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  final ThemeMode? themeMode;

  const ThemeInitial({
    this.themeMode = ThemeMode.system,
  });

  @override
  List<Object?> get props => [
        themeMode,
      ];
}

class ThemeChanged extends ThemeState {
  final ThemeData? themeData;
  final AppTheme? appTheme;
  final ThemeMode? themeMode;
  final bool? isDarkMode;

  const ThemeChanged({
    this.themeData,
    this.appTheme,
    this.themeMode,
    this.isDarkMode,
  });

  @override
  List<Object?> get props => [
        themeData,
        appTheme,
        themeMode,
        isDarkMode,
      ];
}

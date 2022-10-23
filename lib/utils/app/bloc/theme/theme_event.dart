part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  final ThemeData? themeData;
  final AppThemes? appThemeEnum;
  final ThemeMode? themeMode;
  final bool? isDarkMode;

  const ChangeTheme({
    this.themeData,
    this.appThemeEnum,
    this.themeMode,
    this.isDarkMode,
  });

  @override
  List<Object?> get props => [
        themeData,
        appThemeEnum,
        themeMode,
        isDarkMode,
      ];
}

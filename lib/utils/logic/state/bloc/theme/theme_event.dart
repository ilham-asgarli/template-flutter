part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  final ThemeData? themeData;
  final AppTheme? appTheme;
  final ThemeMode? themeMode;
  final bool? isDarkMode;

  const ChangeTheme({
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

part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  final AppTheme appTheme;
  final ThemeMode? themeMode;

  const ChangeTheme({
    required this.appTheme,
    this.themeMode,
  });

  @override
  List<Object?> get props => [
        appTheme,
        themeMode,
      ];
}

part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

/*class ThemeInitial extends ThemeState {
  ThemeInitial()
      : super(
          themeData: CommonTheme.instance.getTheme(
            CustomLightTheme.instance.getLightTheme(),
          ),
          appThemeEnum: AppThemes.LIGHT,
          themeMode: ThemeMode.system,
          isDarkMode: false,
        );

  @override
  List<Object?> get props => [
        themeData,
        appThemeEnum,
        themeMode,
        isDarkMode,
      ];
}*/

class ThemeChanged extends ThemeState {
  final ThemeData? themeData;
  final AppThemes? appThemeEnum;
  final ThemeMode? themeMode;
  final bool? isDarkMode;

  const ThemeChanged({
    this.themeData,
    this.appThemeEnum = AppThemes.LIGHT,
    this.themeMode = ThemeMode.system,
    this.isDarkMode = false,
  });

  @override
  List<Object?> get props => [
        themeData,
        appThemeEnum,
        themeMode,
        isDarkMode,
      ];
}

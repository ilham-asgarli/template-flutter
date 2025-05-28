part of 'theme_cubit.dart';

class ThemeState {
  final AppTheme appTheme;
  final ThemeMode themeMode;

  const ThemeState({
    this.appTheme = AppTheme.main,
    this.themeMode = ThemeMode.system,
  });

  ThemeState copyWith({
    AppTheme? appTheme,
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      appTheme: json['appTheme'].toString().asEnumOr(
            AppTheme.values,
            AppTheme.main,
          ),
      themeMode: json['themeMode'].toString().asEnumOr(
            ThemeMode.values,
            ThemeMode.system,
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appTheme': appTheme.name,
      'themeMode': themeMode.name,
    };
  }
}

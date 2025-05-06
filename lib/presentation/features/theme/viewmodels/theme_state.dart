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
      appTheme: AppTheme.values.firstWhere(
        (e) => e.name == json['appTheme'],
        orElse: () => AppTheme.main,
      ),
      themeMode: ThemeMode.values.firstWhere(
        (e) => e.name == json['themeMode'],
        orElse: () => ThemeMode.system,
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

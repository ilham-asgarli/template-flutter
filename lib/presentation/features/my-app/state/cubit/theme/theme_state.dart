part of 'theme_cubit.dart';

@Freezed()
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(AppTheme.main) AppTheme appTheme,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _ThemeState;

  factory ThemeState.fromJson(Map<String, Object?> json) =>
      _$ThemeStateFromJson(json);
}

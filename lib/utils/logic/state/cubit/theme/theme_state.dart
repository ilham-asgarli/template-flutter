part of 'theme_cubit.dart';

@Freezed()
class ThemeState with _$ThemeState {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory ThemeState({
    @Default(AppTheme.main) AppTheme appTheme,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _ThemeState;

  factory ThemeState.fromJson(Map<String, Object?> json) =>
      _$ThemeStateFromJson(json);
}

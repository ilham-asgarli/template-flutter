// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeStateImpl _$$ThemeStateImplFromJson(Map<String, dynamic> json) =>
    _$ThemeStateImpl(
      appTheme: $enumDecodeNullable(_$AppThemeEnumMap, json['app_theme']) ??
          AppTheme.main,
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['theme_mode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$$ThemeStateImplToJson(_$ThemeStateImpl instance) =>
    <String, dynamic>{
      'app_theme': _$AppThemeEnumMap[instance.appTheme]!,
      'theme_mode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$AppThemeEnumMap = {
  AppTheme.main: 'main',
  AppTheme.example: 'example',
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

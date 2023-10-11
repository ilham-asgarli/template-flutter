// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThemeStateImpl _$$ThemeStateImplFromJson(Map<String, dynamic> json) =>
    _$ThemeStateImpl(
      appTheme: $enumDecodeNullable(_$AppThemeEnumMap, json['appTheme']) ??
          AppTheme.main,
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$$ThemeStateImplToJson(_$ThemeStateImpl instance) =>
    <String, dynamic>{
      'appTheme': _$AppThemeEnumMap[instance.appTheme]!,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$AppThemeEnumMap = {
  AppTheme.main: 'main',
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

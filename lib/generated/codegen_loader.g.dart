// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> az_AZ = {
  "notFoundNavigation": "403",
  "noInternet": "İnternet bağlantınız yoxdur."
};
static const Map<String,dynamic> en_US = {
  "notFoundNavigation": "403",
  "noInternet": "You don't have internet connection."
};
static const Map<String,dynamic> tr_TR = {
  "notFoundNavigation": "403",
  "noInternet": "İnternet bağlantınız yok."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"az_AZ": az_AZ, "en_US": en_US, "tr_TR": tr_TR};
}

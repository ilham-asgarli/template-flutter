import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/interceptors/error_interceptor.dart';
import '../constants/di/path_provider_constants.dart';

@module
abstract class RegisterModule {
  @singleton
  Logger get logger => Logger(
        printer: PrettyPrinter(
          printTime: true,
        ),
      );

  @singleton
  Dio get dio => Dio()..interceptors.add(ErrorInterceptor());

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Named(PathProviderConstants.applicationDocumentsDirectory)
  @preResolve
  @lazySingleton
  Future<Directory> get applicationDocumentsDirectory =>
      getApplicationDocumentsDirectory();

  @Named(PathProviderConstants.temporaryDirectory)
  @preResolve
  @lazySingleton
  Future<Directory> get temporaryDirectory => getTemporaryDirectory();

  @Named(PathProviderConstants.applicationCacheDirectory)
  @preResolve
  @lazySingleton
  Future<Directory> get applicationCacheDirectory =>
      getApplicationCacheDirectory();

  @Named(PathProviderConstants.applicationSupportDirectory)
  @preResolve
  @lazySingleton
  Future<Directory> get applicationSupportDirectory =>
      getApplicationSupportDirectory();
}

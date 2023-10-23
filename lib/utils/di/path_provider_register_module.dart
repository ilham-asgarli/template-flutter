import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/di/path_provider_constants.dart';

@module
abstract class PathProviderRegisterModule {
  @Named(PathProviderConstants.applicationDocuments)
  @preResolve
  @lazySingleton
  Future<Directory> get applicationDocumentsDirectory =>
      getApplicationDocumentsDirectory();

  @Named(PathProviderConstants.temporary)
  @lazySingleton
  Future<Directory> get temporaryDirectory => getTemporaryDirectory();

  @Named(PathProviderConstants.applicationCache)
  @lazySingleton
  Future<Directory> get applicationCacheDirectory =>
      getApplicationCacheDirectory();

  @Named(PathProviderConstants.applicationSupport)
  @lazySingleton
  Future<Directory> get applicationSupportDirectory =>
      getApplicationSupportDirectory();
}

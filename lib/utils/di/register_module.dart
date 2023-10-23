import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/utils/interceptors/error_interceptor.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Logger get logger => Logger(
        printer: PrettyPrinter(
          printTime: true,
        ),
      );

  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.addAll([
      ErrorInterceptor(),
      LogInterceptor(),
    ]);

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

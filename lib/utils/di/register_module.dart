import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user/user.model.dart';
import '../../data/utils/interceptors/error_interceptor.dart';
import '../../presentation/utils/l10n/gen/app_localizations.dart';
import '../../presentation/utils/managers/isar_manager.dart';
import '../constants/env/env.dart';
import '../constants/env/env.dev.dart';
import '../constants/env/env.prod.dart';
import 'injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Env get env => kDebugMode ? DevEnv() : ProdEnv();

  @lazySingleton
  AppLocalizations get l10n => AppLocalizations.of(getIt())!;

  @lazySingleton
  Logger get logger => Logger(
        printer: PrettyPrinter(
          printTime: true,
        ),
      );

  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ),
      )..interceptors.addAll([
          ErrorInterceptor(),
          if (kDebugMode)
            LogInterceptor(
              requestBody: true,
              responseBody: true,
            ),
        ]);

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage();

  @lazySingleton
  Isar get isar => getIt<IsarManager>().open(
        schemas: [
          UserModelSchema,
        ],
      );
}

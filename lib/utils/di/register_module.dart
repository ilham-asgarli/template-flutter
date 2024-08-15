import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/utils/config/local/init_db.dart';
import '../../data/utils/constants/db/db_constants.dart';
import '../../data/utils/interceptors/error_interceptor.dart';
import '../../presentation/utils/l10n/gen/app_localizations.dart';
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
          headers: {
            HttpHeaders.contentTypeHeader: ContentType.json.value,
          },
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
  FlutterSecureStorage get storage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );

  @preResolve
  @lazySingleton
  Future<Database> get db => openDatabase(
        DbConstants.dbName,
        version: DbConstants.version,
        onOpen: (db) {
          InitDb(db: db).createUsers();
        },
      );
}

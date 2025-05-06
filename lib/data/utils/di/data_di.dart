import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/repositories/auth/remote/auth.remote.repository.dart';
import '../../../domain/repositories/user/local/user.local.repository.dart';
import '../../../domain/repositories/user/remote/user.remote.repository.dart';
import '../../../presentation/features/auth/viewmodels/auth_cubit.dart';
import '../../../utils/di/app_di.dart';
import '../../datasources/auth/remote/auth.remote.datasource.dart';
import '../../datasources/user/local/user.local.datasource.dart';
import '../../datasources/user/remote/user.remote.datasource.dart';
import '../../repositories/auth/remote/auth.remote.repository.impl.dart';
import '../../repositories/user/local/user.local.repository.impl.dart';
import '../../repositories/user/remote/user.remote.repository.impl.dart';
import '../config/local/init_db.dart';
import '../constants/db/db_constants.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/error_interceptor.dart';

void injectData() {
  /**
   * Remote
   */

  getIt.registerLazySingleton<Dio>(() => Dio(
        BaseOptions(
          headers: {
            HttpHeaders.contentTypeHeader: ContentType.json.value,
          },
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ),
      )..interceptors.addAll([
          getIt<ErrorInterceptor>(),
          if (kDebugMode)
            LogInterceptor(
              requestBody: true,
              responseBody: true,
            ),
        ]));

  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt()));
  getIt.registerLazySingleton<AuthRemoteRepository>(
      () => AuthRemoteRepositoryImpl(authRemoteDataSource: getIt()));

  // User
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSource(getIt()));
  getIt.registerLazySingleton<UserRemoteRepository>(
      () => UserRemoteRepositoryImpl(userRemoteDataSource: getIt()));

  /**
   * Local
   */

  getIt.registerSingletonAsync<Database>(() => openDatabase(
        DbConstants.dbName,
        version: DbConstants.version,
        onOpen: (db) {
          InitDb(db: db).createUsers();
        },
      ));

  // User
  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(db: getIt()));
  getIt.registerLazySingleton<UserLocalRepository>(
      () => UserLocalRepositoryImpl(userLocalDataSource: getIt()));

  /**
   * Interceptors
   */

  getIt.registerLazySingleton<ErrorInterceptor>(() => ErrorInterceptor());
}

injectDataAfterContext({
  required BuildContext context,
  required AuthCubit authCubit,
}) {
  getIt.registerLazySingleton(() => context);
  getIt.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(
        authRemoteRepository: getIt(),
        dio: getIt(),
        secureStorage: getIt(),
        authCubit: authCubit,
      ));

  getIt<Dio>().interceptors.insert(0, getIt<AuthInterceptor>());
}

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/utils/di/data_di.dart';
import '../../domain/utils/di/domain_di.dart';
import '../../presentation/utils/di/presentation_di.dart';
import '../../presentation/utils/l10n/gen/app_localizations.dart';
import '../constants/di/path_provider_constants.dart';
import '../constants/env/env.dart';
import '../constants/env/env.dev.dart';
import '../constants/env/env.prod.dart';

final getIt = GetIt.instance;

void inject() {
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  getIt.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(
            aOptions: AndroidOptions(
              encryptedSharedPreferences: true,
            ),
          ));
  getIt.registerLazySingleton<Logger>(() => Logger(
        printer: PrettyPrinter(
          dateTimeFormat: DateTimeFormat.dateAndTime,
        ),
      ));
  getIt.registerLazySingleton<Env>(() => kDebugMode ? DevEnv() : ProdEnv());
  getIt.registerLazySingleton<AppLocalizations>(
      () => AppLocalizations.of(getIt())!);

  // Path provider
  getIt.registerSingletonAsync<Directory>(
    () => getApplicationDocumentsDirectory(),
    instanceName: PathProviderConstants.applicationDocuments,
  );
  getIt.registerSingletonAsync<Directory>(
    () => getTemporaryDirectory(),
    instanceName: PathProviderConstants.temporary,
  );
  getIt.registerSingletonAsync<Directory>(
    () => getApplicationCacheDirectory(),
    instanceName: PathProviderConstants.applicationCache,
  );
  getIt.registerSingletonAsync<Directory>(
    () => getApplicationSupportDirectory(),
    instanceName: PathProviderConstants.applicationSupport,
  );

  injectData();
  injectDomain();
  injectPresentation();
}

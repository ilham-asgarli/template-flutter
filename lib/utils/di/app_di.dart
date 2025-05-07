import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/utils/di/data_di.dart';
import '../../domain/utils/di/domain_di.dart';
import '../../presentation/utils/di/presentation_di.dart';
import '../constants/app/app_constants.dart';
import '../constants/di/path_provider_constants.dart';
import '../constants/env/env.dart';

final getIt = GetIt.instance;

void inject() {
  getIt.registerLazySingleton<Logger>(() => Logger(
        filter: DevelopmentFilter(),
        level: Level.all,
        printer: PrettyPrinter(
          dateTimeFormat: DateTimeFormat.dateAndTime,
        ),
      ));
  getIt.registerLazySingleton<Env>(() => AppConstants.env);

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

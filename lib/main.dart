import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'flavors.dart';
import 'presentation/features/app/views/app_view.dart';
import 'presentation/utils/helpers/bloc/all_bloc_observer.dart';
import 'presentation/utils/helpers/http/my_http_overrides.dart';
import 'presentation/utils/helpers/universal/universal_helper.dart'
    if (dart.library.io) 'presentation/utils/helpers/universal/universal_for_mobile.dart'
    if (dart.library.html) 'presentation/utils/helpers/universal/universal_for_web.dart'
    as universal;
import 'utils/constants/di/path_provider_constants.dart';
import 'utils/di/app_di.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await init();
  runApp(const AppView());
  FlutterNativeSplash.remove();
}

Future<void> init() async {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );
  inject();
  HttpOverrides.global = MyHttpOverrides();
  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    getIt.allReady(),
    universal.get().init(),
    Firebase.initializeApp(
        //options: DefaultFirebaseOptions.currentPlatform,
        ),
  ]);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(getIt<Directory>(
                instanceName: PathProviderConstants.applicationDocuments)
            .path),
  );
  Bloc.observer = AllBlocObserver();
}

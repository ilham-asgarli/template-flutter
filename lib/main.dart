import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'data/utils/interceptors/auth_interceptor.dart';
import 'presentation/utils/helpers/bloc/all_bloc_observer.dart';
import 'presentation/utils/helpers/http/my_http_overrides.dart';
import 'presentation/utils/helpers/universal/universal_helper.dart'
    if (dart.library.io) 'presentation/utils/helpers/universal/universal_for_mobile.dart'
    if (dart.library.html) 'presentation/utils/helpers/universal/universal_for_web.dart'
    as universal;
import 'presentation/views/my_app_view.dart';
import 'utils/constants/di/path_provider_constants.dart';
import 'utils/di/injectable.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await init();
  runApp(MyAppView(viewModel: getIt()));
  FlutterNativeSplash.remove();
}

Future<void> init() async {
  HttpOverrides.global = MyHttpOverrides();
  await Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    configureDependencies(),
    universal.get().init(),
  ]);
  final Directory storage = kIsWeb
      ? HydratedStorage.webStorageDirectory
      : getIt(instanceName: PathProviderConstants.applicationDocuments);
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: storage);
  Bloc.observer = AllBlocObserver();
  getIt<Dio>().interceptors.insert(
      0,
      AuthInterceptor(
        dio: getIt(),
        secureStorage: getIt(),
        authRemoteDataSource: getIt(),
      ));
}

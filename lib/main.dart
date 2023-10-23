import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'presentation/features/my-app/views/my_app_view.dart';
import 'presentation/utils/extensions/string_extension.dart';
import 'presentation/utils/helpers/http/my_http_overrides.dart';
import 'presentation/utils/helpers/universal/universal_helper.dart'
    if (dart.library.io) 'presentation/utils/helpers/universal/universal_for_mobile.dart'
    if (dart.library.html) 'presentation/utils/helpers/universal/universal_for_web.dart'
    as universal;
import 'utils/constants/di/path_provider_constants.dart';
import 'utils/constants/env/env_constants.dart';
import 'utils/di/injectable.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await init();
  runApp(MyAppView(myAppViewModel: getIt()));
  FlutterNativeSplash.remove();
}

Future<void> init() async {
  HttpOverrides.global = MyHttpOverrides();
  String env = await rootBundle.loadString(EnvConstants.fileName.toEnv);
  await Future.wait([
    configureDependencies(),
    universal.get().init(),
    if (env.isNotEmpty) dotenv.load(fileName: EnvConstants.fileName.toEnv),
  ]);
  final Directory storage = kIsWeb
      ? HydratedStorage.webStorageDirectory
      : getIt(instanceName: PathProviderConstants.applicationDocuments);
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: storage);
}

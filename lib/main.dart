import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'presentation/features/my-app/state/cubit/network/network_cubit.dart';
import 'presentation/features/my-app/state/cubit/theme/theme_cubit.dart';
import 'presentation/features/my-app/views/my_app_view.dart';
import 'utils/constants/di/path_provider_constants.dart';
import 'utils/constants/env/env_constants.dart';
import 'utils/di/injectable.dart';
import 'utils/extensions/string_extension.dart';
import 'utils/helpers/http/my_http_overrides.dart';
import 'utils/helpers/universal/universal_helper.dart'
    if (dart.library.io) 'utils/helpers/universal/universal_for_mobile.dart'
    if (dart.library.html) 'utils/helpers/universal/universal_for_web.dart'
    as universal;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await init();
  runApp(app());
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
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : getIt<Directory>(
            instanceName: PathProviderConstants.applicationDocumentsDirectory),
  );
}

Widget app() {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => ThemeCubit(),
      ),
      BlocProvider(
        lazy: false,
        create: (_) => NetworkCubit(),
      ),
    ],
    child: DevicePreview(
      enabled: false, //kDebugMode
      builder: (context) => MyAppView(
        myAppViewModel: getIt(),
        themeHelper: getIt(),
      ),
    ),
  );
}

import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'presentation/features/my-app/state/cubit/network/network_cubit.dart';
import 'presentation/features/my-app/state/cubit/theme/theme_cubit.dart';
import 'presentation/features/my-app/views/my_app_view.dart';
import 'utils/di/injectable.dart';
import 'utils/helpers/http/my_http_overrides.dart';

void main() async {
  await init();
  runApp(app());
}

Future<void> init() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // usePathUrlStrategy(); // setUrlStrategy(PathUrlStrategy());
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  // await dotenv.load(fileName: EnvConstants.fileName.toEnv);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  HttpOverrides.global = MyHttpOverrides();
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
      builder: (context) => const MyAppView(),
    ),
  );
}

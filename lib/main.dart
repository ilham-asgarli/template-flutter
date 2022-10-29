import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/init/cache/shared_preferences_manager.dart';
import 'generated/codegen_loader.g.dart';
import 'presentation/features/my-app/views/my_app_view.dart';
import 'utils/app/state/cubit/network/network_cubit.dart';
import 'utils/app/state/bloc/theme/theme_bloc.dart';

void main() async {
  init();
}

void init() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await SharedPreferencesManager.preferencesInit();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(
      app(),
    ),
    storage: storage,
  );
}

Widget app() {
  return EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('az', 'AZ'),
      Locale('tr', 'TR'),
    ],
    path: 'assets/translations',
    assetLoader: const CodegenLoader(),
    startLocale: const Locale('az', 'AZ'),
    fallbackLocale: const Locale('en', 'US'),
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => NetworkCubit(),
        ),
      ],
      child: DevicePreview(
        enabled: false, //!kReleaseMode
        builder: (context) => const MyAppView(),
      ),
    ),
  );
}

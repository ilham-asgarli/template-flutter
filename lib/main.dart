import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/cache/shared_preferences_manager.dart';
import 'core/constants/app/locale_constants.dart';
import 'presentation/features/my-app/views/my_app_view.dart';
import 'utils/logic/state/bloc/theme/theme_bloc.dart';
import 'utils/logic/state/cubit/network/network_cubit.dart';

void main() async {
  await init();
}

Future<void> init() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await SharedPreferencesManager.preferencesInit();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(app());
}

Widget app() {
  return EasyLocalization(
    supportedLocales: LocaleConstants.supportedLocales,
    path: LocaleConstants.path,
    //startLocale: kDebugMode ? LocaleConstants.azAZ : null,
    fallbackLocale: LocaleConstants.enUS,
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(
          create: (_) => NetworkCubit(),
        ),
      ],
      child: DevicePreview(
        enabled: false, //!kReleaseMode
        builder: (context) => const MyAppView(),
      ),
    ),
  );
}

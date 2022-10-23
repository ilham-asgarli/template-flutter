import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:template/utils/app/bloc/theme/theme_bloc.dart';

import 'core/init/cache/hive_manager.dart';
import 'core/init/cache/shared_preferences_manager.dart';
import 'generated/codegen_loader.g.dart';
import 'presentation/features/my-app/views/my_app_view.dart';
import 'utils/app/constants/cache/hive_constants.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await HiveManager.instance.openHiveBox(HiveConstants.userBox);
  await SharedPreferencesManager.preferencesInit();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('az', 'AZ')],
      path: 'assets/translations',
      assetLoader: const CodegenLoader(),
      startLocale: const Locale('az', 'AZ'),
      fallbackLocale: const Locale('en', 'US'),
      child: MultiBlocProvider(
        providers: [
          /*...ApplicationProvider.instance.dependItems,
            ...ApplicationProvider.instance.uiChangesItems*/
          BlocProvider(
            create: (_) =>
                ThemeBloc()..add(const ChangeTheme(isDarkMode: true)),
          ),
        ],
        child: DevicePreview(
          enabled: false, //!kReleaseMode
          builder: (context) => const MyAppView(),
        ),
      ),
    ),
  );
}

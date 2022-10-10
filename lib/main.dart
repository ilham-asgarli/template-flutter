import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'core/init/cache/hive_manager.dart';
import 'core/init/cache/shared_preferences_manager.dart';
import 'generated/codegen_loader.g.dart';
import 'presentation/features/my-app/views/my_app_view.dart';
import 'utils/app/constants/cache/hive_constants.dart';
import 'utils/app/notifiers/provider_list.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await HiveManager.instance.openHiveBox(HiveConstants.userBox);
  await SharedPreferencesManager.preferencesInit();

  runApp(
    DevicePreview(
      enabled: false, //!kReleaseMode
      builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('az', 'AZ')],
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        startLocale: const Locale('az', 'AZ'),
        fallbackLocale: const Locale('en', 'US'),
        child: MultiProvider(
          providers: [
            ...ApplicationProvider.instance.dependItems,
            ...ApplicationProvider.instance.uiChangesItems
          ],
          child: const MyAppView(),
        ),
      ),
    ),
  );
}

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'presentation/features/my-app/views/my_app_view.dart';
import 'utils/logic/state/bloc/theme/theme_bloc.dart';
import 'utils/logic/state/cubit/network/network_cubit.dart';

void main() async {
  await init();
  runApp(app());
}

Future<void> init() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  // await dotenv.load(fileName: EnvConstants.fileName.toEnv);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  // HttpOverrides.global = MyHttpOverrides();
}

Widget app() {
  return MultiBlocProvider(
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
  );
}

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../utils/di/injectable.dart';
import '../../../utils/constants/app/app_constants.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/l10n/gen/app_localizations.dart';
import '../state/bloc/network/network_bloc.dart';
import '../state/cubit/theme/theme_cubit.dart';
import '../view-models/my_app_view_model.dart';

class MyAppView extends StatelessWidget {
  final MyAppViewModel viewModel;

  const MyAppView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => getIt(),
        ),
        BlocProvider<NetworkBloc>(
          lazy: false,
          create: (_) => getIt(),
        ),
      ],
      child: DevicePreview(
        enabled: false, //kDebugMode
        builder: (context) => KeyboardVisibilityProvider(
          child: MaterialApp.router(
            routerConfig: viewModel.goRouter,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: kDebugMode ? const Locale("tr", "TR") : null,
            theme: viewModel.themeHelper
                .getCustomTheme(context.watch<ThemeCubit>().state.appTheme)
                .getTheme(ThemeMode.light),
            darkTheme: viewModel.themeHelper
                .getCustomTheme(context.watch<ThemeCubit>().state.appTheme)
                .getTheme(ThemeMode.dark),
            themeMode: context.watch<ThemeCubit>().state.themeMode,
            scaffoldMessengerKey: AppConstants.scaffoldMessengerKey,
            builder: (context, child) {
              try {
                getIt.registerLazySingleton(() => context);
              } catch (e) {}
              return MediaQuery(
                data: context.mediaQuery.copyWith(
                  textScaler: TextScaler.linear(
                    context.textScaleFactor(baseWidth: 414),
                  ),
                ),
                child: child!,
              );
            },
          ),
        ),
      ),
    );
  }
}

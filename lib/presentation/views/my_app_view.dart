import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../utils/di/injectable.dart';
import '../utils/config/router/app_route_information_parser.dart';
import '../utils/config/router/app_router_delegate.dart';
import '../utils/constants/app/app_constants.dart';
import '../utils/extensions/context_extension.dart';
import '../utils/helpers/theme/theme_helper.dart';
import '../utils/l10n/gen/app_localizations.dart';
import '../viewmodels/app/network/network_bloc.dart';
import '../viewmodels/app/route/route_cubit.dart';
import '../viewmodels/app/theme/theme_cubit.dart';
import '../viewmodels/ephemeral/my-app/my_app_view_cubit.dart';

class MyAppView extends StatelessWidget {
  final MyAppViewCubit viewModel;
  final ThemeHelper themeHelper;

  const MyAppView({
    super.key,
    required this.viewModel,
    required this.themeHelper,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => getIt(),
        ),
        BlocProvider<RouteCubit>(
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
            debugShowCheckedModeBanner: false,
            routerDelegate: AppRouterDelegate(),
            routeInformationParser: AppRouteInformationParser(),
            scaffoldMessengerKey: AppConstants.scaffoldMessengerKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: kDebugMode ? const Locale("tr", "TR") : null,
            theme: themeHelper
                .getCustomTheme(context.watch<ThemeCubit>().state.appTheme)
                .getTheme(ThemeMode.light),
            darkTheme: themeHelper
                .getCustomTheme(context.watch<ThemeCubit>().state.appTheme)
                .getTheme(ThemeMode.dark),
            themeMode: context.watch<ThemeCubit>().state.themeMode,
            builder: (context, child) {
              viewModel.injectContext(context);
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

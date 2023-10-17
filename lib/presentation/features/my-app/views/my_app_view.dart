import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app/global_key_constants.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../../utils/config/router/config_router.dart';
import '../../../../utils/helpers/theme/theme_helper.dart';
import '../../not-found-navigation/views/not_found_navigation_view.dart';
import '../state/cubit/theme/theme_cubit.dart';
import '../view-models/my_app_view_model.dart';

class MyAppView extends StatelessWidget {
  final MyAppViewModel myAppViewModel;
  final ThemeHelper themeHelper;

  const MyAppView({
    Key? key,
    required this.myAppViewModel,
    required this.themeHelper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Sizer(
        builder: (context, orientation, deviceType) => buildApp(context),
      ),
    );
  }

  Widget buildApp(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        debugLogDiagnostics: kDebugMode,
        routes: $appRoutes,
        navigatorKey: GlobalKeyConstants.navigatorKey,
        errorBuilder: (context, state) => const NotFoundNavigationView(),
        redirect: (BuildContext context, GoRouterState state) {
          return null;
        },
      ),
      debugShowCheckedModeBanner: false,
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
      scaffoldMessengerKey: GlobalKeyConstants.scaffoldMessengerKey,
    );
  }
}

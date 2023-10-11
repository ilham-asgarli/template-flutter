import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/base/views/base_app_lifecycle_view.dart';
import '../../../../core/constants/app/global_key_constants.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../../utils/logic/config/router/config_router.dart';
import '../../../../utils/logic/helpers/theme/theme_helper.dart';
import '../../../../utils/logic/state/cubit/theme/theme_cubit.dart';
import '../../not-found-navigation/views/not_found_navigation_view.dart';
import '../view-models/my_app_view_model.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  final MyAppViewModel _myAppViewModel = MyAppViewModel();

  @override
  void initState() {
    _myAppViewModel.removeSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Sizer(
        builder: (context, orientation, deviceType) => buildApp(),
      ),
    );
  }

  Widget buildApp() {
    return BaseAppLifeCycleView(
      child: MaterialApp.router(
        routerConfig: GoRouter(
          debugLogDiagnostics: kDebugMode,
          routes: $appRoutes,
          errorBuilder: (context, state) => const NotFoundNavigationView(),
          redirect: (BuildContext context, GoRouterState state) {
            return null;
          },
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: kDebugMode ? const Locale("tr", "TR") : null,
        theme: ThemeHelper.instance
            .getCustomTheme(context.watch<ThemeCubit>().state.appTheme)
            .getTheme(ThemeMode.light),
        darkTheme: ThemeHelper.instance
            .getCustomTheme(context.watch<ThemeCubit>().state.appTheme)
            .getTheme(ThemeMode.dark),
        themeMode: context.watch<ThemeCubit>().state.themeMode,
        scaffoldMessengerKey: GlobalKeyConstants.scaffoldMessengerKey,
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/base/views/base_app_lifecycle_view.dart';
import '../../../../core/base/views/base_brightness_change_view.dart';
import '../../../../core/constants/app/global_key_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../../utils/logic/config/router/config_router.dart';
import '../../../../utils/logic/helpers/theme/theme_helper.dart';
import '../../../../utils/logic/state/cubit/network/network_cubit.dart';
import '../../../../utils/logic/state/cubit/theme/theme_cubit.dart';
import '../../../widgets/have_no.dart';
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
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: Sizer(
        builder: (context, orientation, deviceType) => buildApp(),
      ),
    );
  }

  Widget buildApp() {
    return BaseAppLifeCycleView(
      child: BaseBrightnessChangeView(
        onChange: () {
          BlocProvider.of<ThemeCubit>(context).changeTheme(null);
        },
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
              .getCustomTheme(
                context.watch<ThemeCubit>().state.appTheme,
                context.watch<ThemeCubit>().state.themeMode,
              )
              .getTheme(),
          scaffoldMessengerKey: GlobalKeyConstants.scaffoldMessengerKey,
          builder: (context, Widget? child) {
            return buildNetworkCubit(child);
          },
        ),
      ),
    );
  }

  Widget buildNetworkCubit(Widget? child) {
    return BlocBuilder<NetworkCubit, NetworkState>(
      builder: (context, NetworkState state) {
        if (child == null) {
          return const SizedBox();
        }

        if (state is! NetworkInitial) {
          _myAppViewModel.removeSplashScreen();
        }

        if (state is ConnectionSuccess) {
          return child;
        }

        if (state is ConnectionFailure) {
          return buildNoInternetWidget(context);
        }

        return const SizedBox();
      },
    );
  }

  Widget buildNoInternetWidget(BuildContext context) {
    return Scaffold(
      body: HaveNo(
        description: context.localization.noInternet,
        iconData: Icons.wifi_off_rounded,
      ),
    );
  }
}

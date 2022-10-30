import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:template/utils/config/theme/light_theme.dart';

import '../../../../core/init/router/navigation_service.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../utils/logic/state/bloc/theme/theme_bloc.dart';
import '../../../../utils/config/router/app_router.dart';
import '../../../../utils/config/theme/common_theme.dart';
import '../../../../utils/config/theme/dark_theme.dart';
import '../../../../utils/logic/state/cubit/network/network_cubit.dart';
import '../../../widgets/have_no.dart';
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
    _myAppViewModel.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => buildThemeBloc(),
    );
  }

  Widget buildThemeBloc() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, ThemeState state) {
        return buildApp(state);
      },
    );
  }

  Widget buildApp(ThemeState themeState) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: themeState.themeMode,
      theme: CommonTheme.instance.getTheme(
        CustomLightTheme.instance.getLightTheme(),
      ),
      darkTheme: CommonTheme.instance.getTheme(
        CustomDarkTheme.instance.getDarkTheme(),
      ),
      onGenerateRoute: AppRouter.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: _myAppViewModel.getInitialRoute(),
      builder: (context, child) {
        return buildNetworkCubit(child);
      },
    );
  }

  Widget buildNetworkCubit(Widget? child) {
    final networkCubitState = context.watch<NetworkCubit>().state;

    return BlocBuilder<NetworkCubit, NetworkState>(
      builder: (context, NetworkState state) {
        if (child == null) {
          return const SizedBox();
        }

        if (networkCubitState is! NetworkInitial) {
          _myAppViewModel.removeSplashScreen();
        }

        if (networkCubitState is ConnectionSuccess) {
          return child;
        }

        if (networkCubitState is ConnectionFailure) {
          return buildNoInternetWidget();
        }

        return const SizedBox();
      },
    );
  }

  buildNoInternetWidget() {
    return SafeArea(
      child: Scaffold(
        body: HaveNo(
          description: LocaleKeys.noInternet.tr(),
          iconData: Icons.wifi_off_rounded,
        ),
      ),
    );
  }
}

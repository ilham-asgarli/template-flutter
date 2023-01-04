import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/base/views/base_app_lifecycle_view.dart';
import '../../../../core/constants/app/global_key_constants.dart';
import '../../../../utils/logic/config/router/config_router.dart';
import '../../../../utils/logic/constants/locale/locale_keys.g.dart';
import '../../../../utils/logic/helpers/theme/theme_helper.dart';
import '../../../../utils/logic/state/bloc/theme/theme_bloc.dart';
import '../../../../utils/logic/state/cubit/network/network_cubit.dart';
import '../../../../utils/ui/config/theme/common/common_theme.dart';
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
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => buildThemeBloc(),
    );
  }

  Widget buildThemeBloc() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        ThemeHelper.instance
            .setSystemUIOverlayStyleWithAppTheme(state.appTheme);

        return buildApp(state);
      },
    );
  }

  Widget buildApp(ThemeState themeState) {
    return BaseAppLifeCycleView(
      child: MaterialApp(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        themeMode: themeState.themeMode,
        theme: CommonTheme.instance.getTheme(
          appTheme: themeState.appTheme,
          themeMode: ThemeMode.light,
        ),
        darkTheme: CommonTheme.instance.getTheme(
          appTheme: themeState.appTheme,
          themeMode: ThemeMode.dark,
        ),
        scaffoldMessengerKey: GlobalKeyConstants.scaffoldMessengerKey,
        navigatorKey: GlobalKeyConstants.navigatorKey,
        onGenerateRoute: ConfigRouter.instance.generateRoute,
        initialRoute: _myAppViewModel.getInitialRoute(),
        builder: (context, Widget? child) {
          return buildNetworkCubit(child);
        },
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
          return buildNoInternetWidget();
        }

        return const SizedBox();
      },
    );
  }

  Widget buildNoInternetWidget() {
    return Scaffold(
      body: HaveNo(
        description: LocaleKeys.noInternet.tr(),
        iconData: Icons.wifi_off_rounded,
      ),
    );
  }
}

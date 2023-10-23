import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/di/injectable.dart';
import '../../../utils/constants/app/app_constants.dart';
import '../../../utils/l10n/gen/app_localizations.dart';
import '../state/bloc/network/network_bloc.dart';
import '../state/cubit/theme/theme_cubit.dart';
import '../view-models/my_app_view_model.dart';

class MyAppView extends StatelessWidget {
  final MyAppViewModel myAppViewModel;

  const MyAppView({
    Key? key,
    required this.myAppViewModel,
  }) : super(key: key);

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
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp.router(
                routerConfig: myAppViewModel.goRouter,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: kDebugMode ? const Locale("tr", "TR") : null,
                theme: myAppViewModel.themeHelper
                    .getCustomTheme(context.watch<ThemeCubit>().state.appTheme)
                    .getTheme(ThemeMode.light),
                darkTheme: myAppViewModel.themeHelper
                    .getCustomTheme(context.watch<ThemeCubit>().state.appTheme)
                    .getTheme(ThemeMode.dark),
                themeMode: context.watch<ThemeCubit>().state.themeMode,
                scaffoldMessengerKey: AppConstants.scaffoldMessengerKey,
              );
            },
          ),
        ),
      ),
    );
  }
}

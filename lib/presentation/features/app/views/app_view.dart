import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../../flavors.dart';
import '../../../../utils/di/app_di.dart';
import '../../../utils/config/router/app_routes.dart';
import '../../../utils/constants/app/presentation_constants.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/gen/app_localizations.dart';
import '../../../utils/helpers/theme/theme_helper.dart';
import '../../auth/viewmodels/auth_cubit.dart';
import '../../network/viewmodels/network_bloc.dart';
import '../../theme/viewmodels/theme_cubit.dart';
import '../viewmodels/app_view_cubit.dart';

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeHelper themeHelper = getIt<ThemeHelper>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider<NetworkBloc>(
          lazy: false,
          create: (_) => NetworkBloc(),
        ),
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(
            secureStorage: getIt(),
            loginUseCase: getIt(),
            registerUseCase: getIt(),
          ),
        ),
        BlocProvider<AppViewCubit>(
          create: (_) => AppViewCubit(),
        ),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) =>
            previous.authState != current.authState,
        listener: (context, state) {
          AppRoutes.router.refresh();
        },
        child: BlocBuilder<ThemeCubit, ThemeState>(
          buildWhen: (previous, current) =>
              previous.appTheme != current.appTheme ||
              previous.themeMode != current.themeMode,
          builder: (context, state) {
            final AppViewCubit viewModel =
                BlocProvider.of<AppViewCubit>(context);

            return KeyboardVisibilityProvider(
              child: MaterialApp.router(
                title: F.name,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRoutes.router,
                scaffoldMessengerKey:
                    PresentationConstants.scaffoldMessengerKey,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: kDebugMode ? const Locale("tr", "TR") : null,
                theme: themeHelper
                    .getCustomTheme(state.appTheme)
                    .getTheme(ThemeMode.light),
                darkTheme: themeHelper
                    .getCustomTheme(state.appTheme)
                    .getTheme(ThemeMode.dark),
                themeMode: state.themeMode,
                builder: (context, child) {
                  viewModel.injectAfterContext(context);
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
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/app/app_constants.dart';
import '../../../features/app/viewmodels/main_view_cubit.dart';
import '../../../features/app/views/main_view.dart';
import '../../../features/app/views/not_found_navigation_view.dart';
import '../../../features/auth/viewmodels/auth_cubit.dart';
import '../../../features/auth/viewmodels/login_view_cubit.dart';
import '../../../features/auth/views/login_view.dart';
import '../../../features/settings/viewmodels/settings_view_cubit.dart';
import '../../../features/settings/views/settings_view.dart';
import '../../constants/enums/app_enum.dart';
import '../../constants/router/router_constants.dart';

abstract class AppRoutes {
  static final router = GoRouter(
    debugLogDiagnostics: AppConstants.enableLogging,
    initialLocation: RouterConstants.home,
    routes: [
      GoRoute(
        path: RouterConstants.login,
        pageBuilder: (context, state) {
          return defaultPageBuilder(
            context: context,
            state: state,
            child: BlocProvider(
              create: (context) => LoginViewCubit(),
              child: const LoginView(),
            ),
          );
        },
      ),
      ShellRoute(
        pageBuilder: (context, state, child) => defaultPageBuilder(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => MainViewCubit(),
            child: MainView(
              state: state,
              child: child,
            ),
          ),
        ),
        routes: [
          GoRoute(
            path: RouterConstants.home,
            pageBuilder: (context, state) {
              return noTransitionPageBuilder(
                context: context,
                state: state,
                child: SizedBox(),
              );
            },
          ),
          GoRoute(
            path: RouterConstants.notification,
            pageBuilder: (context, state) {
              return noTransitionPageBuilder(
                context: context,
                state: state,
                child: SizedBox(),
              );
            },
          ),
          GoRoute(
            path: RouterConstants.settings,
            pageBuilder: (context, state) {
              return noTransitionPageBuilder(
                context: context,
                state: state,
                child: BlocProvider(
                  create: (context) => SettingsViewCubit(),
                  child: const SettingsView(),
                ),
              );
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return defaultPageBuilder(
        context: context,
        state: state,
        child: const NotFoundNavigationView(),
      );
    },
    redirect: (context, state) async {
      final authState = context.read<AuthCubit>().state.authState;
      if (authState == BlocState.success) {
        return null;
      }
      return RouterConstants.login;
    },
  );

  static Page noTransitionPageBuilder({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) =>
      NoTransitionPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: child,
      );

  static Page defaultPageBuilder({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) =>
      MaterialPage(
        key: state.pageKey,
        restorationId: state.pageKey.value,
        child: child,
      );
}

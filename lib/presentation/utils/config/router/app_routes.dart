import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/di/app_di.dart';
import '../../../features/404/views/not_found_navigation_view.dart';
import '../../../features/main/views/main_view.dart';
import '../../constants/router/router_constants.dart';

final appRoutes = GoRouter(
  initialLocation: RouterConstants.main,
  routes: [
    GoRoute(
      path: RouterConstants.main,
      pageBuilder: (context, state) {
        return MaterialPage(child: MainView(viewModel: getIt()));
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(child: NotFoundNavigationView());
  },
);

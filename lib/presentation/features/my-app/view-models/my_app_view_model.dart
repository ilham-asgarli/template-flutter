import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/di/injectable.dart';
import '../../../utils/config/router/config_router.dart';
import '../../../utils/constants/app/app_constants.dart';
import '../../../utils/helpers/theme/theme_helper.dart';
import '../../not-found-navigation/views/not_found_navigation_view.dart';

@injectable
class MyAppViewModel {
  final ThemeHelper themeHelper = getIt();

  final GoRouter goRouter = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
    navigatorKey: AppConstants.navigatorKey,
    errorBuilder: (context, state) => const NotFoundNavigationView(),
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
  );
}

import 'package:flutter/material.dart';

import '../../../../presentation/features/home/views/home_view.dart';
import '../../../../presentation/features/not-found-navigation/views/not_found_navigation_view.dart';
import '../../constants/router/router_constants.dart';

class AppRouter {
  static final AppRouter instance = AppRouter._init();

  AppRouter._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.home:
        return normalNavigate(
          const HomeView(),
          RouterConstants.home,
        );
      default:
        //throw NavigateException<SettingsDynamicModel>(args.arguments);
        return normalNavigate(
          const NotFoundNavigationView(),
          RouterConstants.notFound,
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}

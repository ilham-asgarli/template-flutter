import 'package:flutter/material.dart';

import '../../../presentation/features/home/views/home_view.dart';
import '../../../presentation/features/not-found-navigation/views/not_found_navigation_view.dart';
import '../../logic/constants/router/router_constants.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._init();

  static AppRouter get instance => _instance;

  AppRouter._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.HOME:
        return normalNavigate(
          const HomeView(),
          RouterConstants.HOME,
        );
      default:
        //throw NavigateException<SettingsDynamicModel>(args.arguments);
        return normalNavigate(
          const NotFoundNavigationView(),
          RouterConstants.NOT_FOUND,
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

import 'package:flutter/material.dart';

import '../../constants/navigation/navigation_constants.dart';
import '../../../../presentation/features/not-found-navigation/views/not_found_navigation.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        //throw NavigateException<SettingsDynamicModel>(args.arguments);
        return normalNavigate(
          const NotFoundNavigation(),
          NavigationConstants.NOT_FOUND,
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

import 'package:flutter/material.dart';

import '../../../../presentation/features/home/views/home_view.dart';
import '../../../../presentation/features/not-found-navigation/views/not_found_navigation_view.dart';
import '../../constants/router/router_constants.dart';
import 'interfaces/router_interface.dart';

class ConfigRouter extends RouterInterface {
  static final ConfigRouter instance = ConfigRouter._init();

  ConfigRouter._init();

  @override
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.home:
        return normalNavigate(
          const HomeView(),
          settings.name!,
        );
      default:
        //throw NavigateException<SettingsDynamicModel>(args.arguments);
        return normalNavigate(
          const NotFoundNavigationView(),
          RouterConstants.notFound,
        );
    }
  }
}

import 'package:flutter/widgets.dart';

import '../../constants/router/router_constants.dart';

class AppRouteInformationParser
    extends RouteInformationParser<List<RouteSettings>> {
  @override
  Future<List<RouteSettings>> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    List<RouteSettings> routeStack = [];

    if (uri.pathSegments.isEmpty) {
      routeStack.add(const RouteSettings(name: RouterConstants.home));
    } else {
      for (var segment in uri.pathSegments) {
        /*if (segment == 'example') {
          routeStack.add(RouteSettings(name: '/example'));
        }*/
      }
    }

    return routeStack;
  }

  @override
  RouteInformation? restoreRouteInformation(List<RouteSettings> configuration) {
    final fullPath = configuration.map((route) => route.name).join('/');
    return RouteInformation(uri: Uri.parse(fullPath));
  }
}

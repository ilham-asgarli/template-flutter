import 'package:flutter/material.dart';

abstract class RouterInterface {
  Route<dynamic> generateRoute(RouteSettings settings);

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}

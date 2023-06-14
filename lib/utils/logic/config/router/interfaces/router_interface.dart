import 'package:flutter/material.dart';

abstract class RouterInterface {
  Route<dynamic> generateRoute(RouteSettings settings);

  MaterialPageRoute normalNavigate<T>(Widget widget, RouteSettings? settings) {
    return MaterialPageRoute<T>(
      builder: (context) => widget,
      settings: settings,
    );
  }
}

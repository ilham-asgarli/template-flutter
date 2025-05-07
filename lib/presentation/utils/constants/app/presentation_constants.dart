import 'package:flutter/material.dart';

abstract class PresentationConstants {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const double borderRadius = 18.0;
}

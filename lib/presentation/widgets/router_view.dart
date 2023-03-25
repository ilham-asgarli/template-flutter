import 'package:flutter/material.dart';

class RouterView extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String? initialRoute;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final Future<bool> Function()? onWillPop;

  const RouterView({
    Key? key,
    required this.navigatorKey,
    this.initialRoute,
    this.onGenerateRoute,
    this.onWillPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ?? defaultOnWillPop,
      child: Navigator(
        key: navigatorKey,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }

  Future<bool> defaultOnWillPop() async {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
      return false;
    }
    return true;
  }
}

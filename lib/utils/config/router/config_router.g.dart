// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainViewRoute,
    ];

RouteBase get $mainViewRoute => GoRouteData.$route(
      path: '/',
      factory: $MainViewRouteExtension._fromState,
    );

extension $MainViewRouteExtension on MainViewRoute {
  static MainViewRoute _fromState(GoRouterState state) => MainViewRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

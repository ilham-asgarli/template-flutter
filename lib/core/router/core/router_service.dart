import 'package:flutter/material.dart';

import '../../constants/app/global_key_constants.dart';
import '../interfaces/router_interface.dart';

class RouterService implements RouterInterface {
  static final RouterService instance = RouterService._init();

  GlobalKey<NavigatorState>? navigatorKey;

  RouterService({this.navigatorKey}) {
    navigatorKey ??= GlobalKeyConstants.navigatorKey;
  }

  RouterService._init() {
    navigatorKey ??= GlobalKeyConstants.navigatorKey;
  }

  bool Function(Route<dynamic>) removeAllOldRoutes =
      (Route<dynamic> route) => false;

  @override
  Future<T?> pushNamed<T extends Object?>({
    BuildContext? context,
    required String path,
    Object? data,
  }) async {
    return await (context != null
            ? Navigator.of(context)
            : navigatorKey?.currentState)
        ?.pushNamed<T>(
      path,
      arguments: data,
    );
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>({
    BuildContext? context,
    required String path,
    Object? data,
    String? removeUntilPageName,
  }) async {
    return await (context != null
            ? Navigator.of(context)
            : navigatorKey?.currentState)
        ?.pushNamedAndRemoveUntil<T>(
      path,
      removeUntilPageName == null
          ? removeAllOldRoutes
          : ModalRoute.withName(removeUntilPageName),
      arguments: data,
    );
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>({
    BuildContext? context,
    required String path,
    Object? data,
  }) async {
    return await (context != null
            ? Navigator.of(context)
            : navigatorKey?.currentState)
        ?.pushReplacementNamed<T, TO>(
      path,
      arguments: data,
    );
  }

  @override
  void pop<T extends Object?>([BuildContext? context, T? result]) async {
    (context != null ? Navigator.of(context) : navigatorKey?.currentState)
        ?.pop(result);
  }

  @override
  void popUntil({
    BuildContext? context,
    String? removeUntilPageName,
  }) {
    (context != null ? Navigator.of(context) : navigatorKey?.currentState)
        ?.popUntil(
      removeUntilPageName == null
          ? removeAllOldRoutes
          : ModalRoute.withName(removeUntilPageName),
    );
  }
}

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
  Future<T?> pushNamed<T extends Object?>(
      {required String path, Object? data}) async {
    return await navigatorKey?.currentState?.pushNamed(
      path,
      arguments: data,
    );
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>({
    required String path,
    Object? data,
    String? removeUntilPageName,
  }) async {
    return await navigatorKey?.currentState?.pushNamedAndRemoveUntil<T>(
      path,
      removeUntilPageName == null
          ? removeAllOldRoutes
          : ModalRoute.withName(removeUntilPageName),
      arguments: data,
    );
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?>(
      {required String path, Object? data}) async {
    return await navigatorKey?.currentState?.pushReplacementNamed(
      path,
      arguments: data,
    );
  }

  @override
  void pop<T extends Object?>([T? result]) async {
    navigatorKey?.currentState?.pop(result);
  }

  @override
  void popUntil({
    String? removeUntilPageName,
  }) {
    navigatorKey?.currentState?.popUntil(
      removeUntilPageName == null
          ? removeAllOldRoutes
          : ModalRoute.withName(removeUntilPageName),
    );
  }
}

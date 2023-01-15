import 'package:flutter/material.dart';

import '../../constants/app/global_key_constants.dart';
import '../interfaces/router_service.dart';

class RouterService implements IRouterService {
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
  Future<void> pushNamed({required String path, Object? data}) async {
    await navigatorKey?.currentState?.pushNamed(
      path,
      arguments: data,
    );
  }

  @override
  Future<void> pushNamedAndRemoveUntil({
    required String path,
    Object? data,
    String? removeUntilPageName,
  }) async {
    await navigatorKey?.currentState?.pushNamedAndRemoveUntil(
      path,
      removeUntilPageName == null
          ? removeAllOldRoutes
          : ModalRoute.withName(removeUntilPageName),
      arguments: data,
    );
  }

  @override
  Future<void> pushReplacementNamed(
      {required String path, Object? data}) async {
    await navigatorKey?.currentState?.pushReplacementNamed(
      path,
      arguments: data,
    );
  }

  @override
  void pop() async {
    navigatorKey?.currentState?.pop();
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

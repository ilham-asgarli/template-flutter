import 'package:flutter/material.dart';

import '../../constants/app/global_key_constants.dart';
import '../interfaces/router_service.dart';

class RouterService implements IRouterService {
  static final RouterService instance = RouterService._init();

  RouterService._init();

  bool Function(Route<dynamic>) removeAllOldRoutes =
      (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required String? path, Object? data}) async {
    await GlobalKeyConstants.navigatorKey.currentState!
        .pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await GlobalKeyConstants.navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }
}

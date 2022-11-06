import 'package:flutter/material.dart';

import '../../cache/shared_preferences_manager.dart';
import '../../router/core/router_service.dart';

abstract class BaseViewModel {
  late BuildContext buildContext;

  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager.instance;
  RouterService navigation = RouterService.instance;

  //Box hiveBox = Hive.box(HiveConstants.userBox);

  /// If you want to set info before screen created call super.init(); first in override on init function
  void init(context) {
    setBuildContext(context);
  }

  void setBuildContext(BuildContext context) {
    buildContext = context;
  }
}

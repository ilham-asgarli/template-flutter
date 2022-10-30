import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../../core/base/view-models/base_view_model.dart';
import '../../../../utils/logic/constants/router/router_constants.dart';

class MyAppViewModel with BaseViewModel {
  void removeSplashScreen() {
    FlutterNativeSplash.remove();
  }

  String getInitialRoute() {
    return RouterConstants.HOME;
  }
}

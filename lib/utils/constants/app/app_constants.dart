import 'package:flutter/foundation.dart';

import '../../../flavors.dart';
import '../env/env.dart';
import '../env/env.dev.dart';
import '../env/env.prod.dart';

abstract class AppConstants {
  static const bool enableLogging = kDebugMode;

  static const bool enableFirebaseCrashlytics = kReleaseMode;

  static Env get env {
    switch (F.appFlavor) {
      case Flavor.dev:
        return DevEnv();
      case Flavor.prod:
        return ProdEnv();
    }
  }
}

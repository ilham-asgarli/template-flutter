import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../utils/di/injectable.dart';

@injectable
class MyAppViewModel {
  void injectContext(BuildContext context) {
    try {
      getIt.registerLazySingleton(() => context);
    } catch (_) {}
  }
}

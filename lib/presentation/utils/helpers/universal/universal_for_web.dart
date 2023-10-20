import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'universal.dart';

Universal get() => UniversalForWeb();

class UniversalForWeb extends Universal {
  @override
  Future<void> init() async {
    usePathUrlStrategy(); // setUrlStrategy(PathUrlStrategy());
  }
}

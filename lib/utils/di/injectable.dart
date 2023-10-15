import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
)
void configureDependencies() => getIt.init();

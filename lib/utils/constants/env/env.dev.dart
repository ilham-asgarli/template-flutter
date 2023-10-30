import 'package:envied/envied.dart';

import 'env.dart';

part 'env.dev.g.dart';

@Envied(
  path: "assets/env/.env.dev",
  obfuscate: true,
)
class DevEnv implements Env {
  @override
  @EnviedField()
  final String KEY = _DevEnv.KEY;
}

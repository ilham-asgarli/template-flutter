import 'package:envied/envied.dart';

import 'env.dart';

part 'env.prod.g.dart';

@Envied(
  path: "assets/env/.env.prod",
  obfuscate: true,
)
class ProdEnv implements Env {
  @override
  @EnviedField()
  final String KEY = _ProdEnv.KEY;
}

import 'universal.dart';

Universal get() => UniversalForMobile();

class UniversalForMobile extends Universal {
  @override
  Future<void> init() async {}
}

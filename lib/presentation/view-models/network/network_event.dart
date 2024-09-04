part of 'network_bloc.dart';

@immutable
abstract class NetworkEvent {
  const NetworkEvent();
}

class Connect extends NetworkEvent {
  const Connect();
}

class FinishConnect extends NetworkEvent {
  final List<ConnectivityResult> connectivityResult;

  const FinishConnect({
    required this.connectivityResult,
  });
}

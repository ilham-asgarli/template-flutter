part of 'network_bloc.dart';

@immutable
abstract class NetworkState {
  final bool connecting;
  final bool connected;
  final bool failed;

  const NetworkState({
    required this.connecting,
    required this.connected,
    required this.failed,
  });
}

class NetworkInitial extends NetworkState {
  const NetworkInitial()
      : super(connecting: false, connected: false, failed: false);
}

class Connecting extends NetworkState {
  const Connecting() : super(connecting: true, connected: false, failed: false);
}

class ConnectionSuccess extends NetworkState {
  final ConnectivityResult connectivityResult;

  const ConnectionSuccess({
    required this.connectivityResult,
  }) : super(connecting: false, connected: true, failed: false);
}

class ConnectionFailure extends NetworkState {
  const ConnectionFailure()
      : super(connecting: false, connected: false, failed: true);
}

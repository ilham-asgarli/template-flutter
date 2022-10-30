part of 'network_cubit.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();
}

class NetworkInitial extends NetworkState {
  @override
  List<Object> get props => [];
}

class ConnectionSuccess extends NetworkState {
  final ConnectivityResult connectivityResult;

  const ConnectionSuccess({
    required this.connectivityResult,
  });

  @override
  List<Object?> get props => [connectivityResult];
}

class ConnectionFailure extends NetworkState {
  @override
  List<Object?> get props => [];
}

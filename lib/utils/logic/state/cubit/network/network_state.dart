part of 'network_cubit.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();
}

class NetworkInitial extends NetworkState {
  @override
  List<Object> get props => [];
}

class ConnectionSuccess extends NetworkState {
  @override
  List<Object?> get props => [];
}

class ConnectionFailure extends NetworkState {
  @override
  List<Object?> get props => [];
}

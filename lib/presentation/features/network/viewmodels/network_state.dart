part of 'network_bloc.dart';

class NetworkState {
  final List<ConnectivityResult>? data;
  final String? error;
  final BlocState state;

  const NetworkState({
    this.data,
    this.error,
    this.state = BlocState.initial,
  });

  NetworkState copyWith({
    List<ConnectivityResult>? data,
    String? error,
    BlocState? state,
  }) {
    return NetworkState(
      data: data ?? this.data,
      error: error ?? this.error,
      state: state ?? this.state,
    );
  }
}

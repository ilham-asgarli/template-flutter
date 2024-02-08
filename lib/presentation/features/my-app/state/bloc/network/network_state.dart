part of 'network_bloc.dart';

@Freezed()
class NetworkState with _$NetworkState {
  const factory NetworkState({
    ConnectivityResult? data,
    String? error,
    @Default(BlocState.initial) BlocState state,
  }) = _NetworkState;

  factory NetworkState.fromJson(Map<String, Object?> json) =>
      _$NetworkStateFromJson(json);
}

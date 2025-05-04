part of 'network_bloc.dart';

@Freezed()
abstract class NetworkState with _$NetworkState {
  const factory NetworkState({
    List<ConnectivityResult>? data,
    String? error,
    @Default(BlocState.initial) BlocState state,
  }) = _NetworkState;

  factory NetworkState.fromJson(Map<String, Object?> json) =>
      _$NetworkStateFromJson(json);
}

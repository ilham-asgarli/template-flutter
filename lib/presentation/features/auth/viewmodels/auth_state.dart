part of 'auth_cubit.dart';

@Freezed()
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(BlocState.initial) BlocState authState,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, Object?> json) =>
      _$AuthStateFromJson(json);
}

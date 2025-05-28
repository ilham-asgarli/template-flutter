part of 'auth_cubit.dart';

class AuthState {
  final BlocState authState;

  const AuthState({
    this.authState = BlocState.initial,
  });

  AuthState copyWith({
    BlocState? authState,
  }) {
    return AuthState(
      authState: authState ?? this.authState,
    );
  }

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      authState: json['authState'].toString().asEnumOr<BlocState>(
            BlocState.values,
            BlocState.initial,
          ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authState': authState.name,
    };
  }
}

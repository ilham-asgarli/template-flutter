import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../data/datasources/auth/local/auth.local.datasource.dart';
import '../../../../domain/usecases/auth/login.usecase.dart';
import '../../../../domain/usecases/auth/register.usecase.dart';
import '../../../../utils/di/app_di.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/string_extension.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final FlutterSecureStorage secureStorage;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthCubit({
    required this.secureStorage,
    required this.loginUseCase,
    required this.registerUseCase,
  }) : super(const AuthState());

  Future<void> login(LoginUseCaseParams loginUseCaseParams) async {
    emit(state.copyWith(authState: BlocState.loading));
    var response = await loginUseCase(loginUseCaseParams);

    response.fold((l) {
      emit(state.copyWith(authState: BlocState.error));
    }, (r) async {
      await getIt<AuthLocalDataSource>().saveTokenEntity(r);
      FirebaseCrashlytics.instance.setUserIdentifier(r.user?.id ?? '');
      emit(state.copyWith(authState: BlocState.success));
    });
  }

  Future<void> register(RegisterUseCaseParams registerUseCaseParams) async {
    emit(state.copyWith(authState: BlocState.loading));
    var response = await registerUseCase(registerUseCaseParams);

    response.fold((l) {
      emit(state.copyWith(authState: BlocState.error));
    }, (r) async {
      await getIt<AuthLocalDataSource>().saveTokenEntity(r);
      FirebaseCrashlytics.instance.setUserIdentifier(r.user?.id ?? '');
      emit(state.copyWith(authState: BlocState.success));
    });
  }

  Future<void> logout() async {
    emit(state.copyWith(authState: BlocState.loading));
    await getIt<AuthLocalDataSource>().clearTokenEntity();
    emit(state.copyWith(authState: BlocState.initial));
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}

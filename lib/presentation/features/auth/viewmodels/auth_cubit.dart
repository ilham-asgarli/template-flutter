import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/constants/cache/flutter_secure_storage_constants.dart';
import '../../../utils/constants/enums/app_enum.dart';

part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FlutterSecureStorage secureStorage;

  AuthCubit({
    required this.secureStorage,
  }) : super(const AuthState());

  Future<void> login() async {
    emit(state.copyWith(authState: BlocState.loading));
    // TODO: Implement login logic
    await secureStorage.write(
        key: FlutterSecureStorageConstants.accessToken, value: 'access_token');
    await secureStorage.write(
        key: FlutterSecureStorageConstants.refreshToken,
        value: 'refresh_token');
    emit(state.copyWith(authState: BlocState.success));
  }

  Future<void> register() async {
    emit(state.copyWith(authState: BlocState.loading));
    // TODO: Implement register logic
    await secureStorage.write(
        key: FlutterSecureStorageConstants.accessToken, value: 'access_token');
    await secureStorage.write(
        key: FlutterSecureStorageConstants.refreshToken,
        value: 'refresh_token');
    emit(state.copyWith(authState: BlocState.success));
  }

  Future<void> logout() async {
    emit(state.copyWith(authState: BlocState.loading));
    await secureStorage.delete(key: FlutterSecureStorageConstants.accessToken);
    await secureStorage.delete(key: FlutterSecureStorageConstants.refreshToken);
    emit(state.copyWith(authState: BlocState.initial));
  }
}

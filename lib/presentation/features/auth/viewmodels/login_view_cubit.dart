import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewCubit() : super(const LoginViewState());
}

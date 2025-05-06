import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/usecases/auth/login.usecase.dart';
import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/constants/router/router_constants.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/extensions/num_extension.dart';
import '../viewmodels/auth_cubit.dart';
import '../viewmodels/login_view_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginViewCubit viewModel = BlocProvider.of<LoginViewCubit>(context);
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authState == BlocState.success) {
          context.go(RouterConstants.main);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: viewModel.usernameController,
                decoration: InputDecoration(labelText: context.l10n.username),
              ),
              5.verticalSpace,
              TextField(
                controller: viewModel.passwordController,
                decoration: InputDecoration(labelText: context.l10n.password),
                obscureText: true,
              ),
              10.verticalSpace,
              ElevatedButton(
                style: context.theme.elevatedButtonTheme.style?.copyWith(
                  fixedSize:
                      WidgetStateProperty.all(Size.fromWidth(context.width)),
                ),
                onPressed: () {
                  authCubit.login(LoginUseCaseParams(
                    username: viewModel.usernameController.text,
                    password: viewModel.passwordController.text,
                  ));
                },
                child: Text(context.l10n.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

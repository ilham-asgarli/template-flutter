import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../domain/usecases/security/get_user_use_case.dart';
import '../../../../utils/di/injectable.dart';
import '../../../utils/constants/enums/app_theme_enum.dart';
import '../../../utils/extensions/num_extension.dart';
import '../../my-app/state/cubit/network/network_cubit.dart';
import '../../my-app/state/cubit/theme/theme_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.watch<NetworkCubit>().state.toString(),
              ),
              10.verticalSpace,
              ElevatedButton(
                onPressed: () async {
                  var theme =
                      switch (context.read<ThemeCubit>().state.appTheme) {
                    AppTheme.main => AppTheme.example,
                    AppTheme.example => AppTheme.main,
                  };

                  BlocProvider.of<ThemeCubit>(context).changeTheme(theme);
                },
                child: Text(
                  context.watch<ThemeCubit>().state.appTheme.toString(),
                ),
              ),
              10.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  var mode =
                      switch (context.read<ThemeCubit>().state.themeMode) {
                    ThemeMode.system => ThemeMode.light,
                    ThemeMode.light => ThemeMode.dark,
                    ThemeMode.dark => ThemeMode.system,
                  };

                  BlocProvider.of<ThemeCubit>(context).changeThemeMode(mode);
                },
                child: Text(
                  context.watch<ThemeCubit>().state.themeMode.toString(),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var response = await getIt<GetUserUseCase>()(
                    const GetUserUseCaseParams(id: "1"),
                  );

                  response.fold((l) {
                    getIt<Logger>().e(l.message);
                  }, (r) {
                    getIt<Logger>().i(r);
                  });
                },
                child: const Text("Get User"),
              ),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

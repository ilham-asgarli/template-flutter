import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/num_extension.dart';
import '../../../../utils/logic/state/cubit/network/network_cubit.dart';
import '../../../../utils/logic/state/cubit/theme/theme_cubit.dart';

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
                onPressed: () {
                  //BlocProvider.of<ThemeCubit>(context).changeTheme(theme);
                },
                child:
                    Text(context.watch<ThemeCubit>().state.appTheme.toString()),
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
                    context.watch<ThemeCubit>().state.themeMode.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

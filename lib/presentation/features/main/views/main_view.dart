import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/logic/state/cubit/theme/theme_cubit.dart';
import '../../../../utils/ui/constants/enums/app_theme_enum.dart';

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
                "Home View",
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).changeTheme(
                      context.read<ThemeCubit>().state.appTheme ==
                              AppTheme.light
                          ? AppTheme.dark
                          : AppTheme.light,
                    );
                  },
                  child: Text("Welcome")),
            ],
          ),
        ),
      ),
    );
  }
}

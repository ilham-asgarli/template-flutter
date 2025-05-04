import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/extensions/num_extension.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../network/viewmodels/network_bloc.dart';
import '../../theme/viewmodels/theme_cubit.dart';
import '../viewmodels/main_view_cubit.dart';

class MainView extends StatelessWidget {
  final MainViewCubit viewModel;

  const MainView({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: context.paddingNormal,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: context.theme.customColors.primary,
                ),
                10.verticalSpace,
                Text(
                  "Example",
                  style: context.theme.customTextTheme.example,
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                BlocBuilder<NetworkBloc, NetworkState>(
                  buildWhen: (previous, current) =>
                      previous.state != current.state,
                  builder: (context, state) {
                    return Text(
                      state.state == BlocState.loading
                          ? "Connecting to Internet"
                          : state.state == BlocState.success
                              ? "Connected to Internet"
                              : state.state == BlocState.error
                                  ? "Failed to connect to Internet"
                                  : "",
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                10.verticalSpace,
                ElevatedButton(
                  onPressed: BlocProvider.of<ThemeCubit>(context).toggleTheme,
                  child: BlocBuilder<ThemeCubit, ThemeState>(
                    buildWhen: (previous, current) =>
                        previous.appTheme != current.appTheme,
                    builder: (context, state) {
                      return Text(
                        state.appTheme.toString(),
                      );
                    },
                  ),
                ),
                10.verticalSpace,
                ElevatedButton(
                  onPressed:
                      BlocProvider.of<ThemeCubit>(context).toggleThemeMode,
                  child: BlocBuilder<ThemeCubit, ThemeState>(
                    buildWhen: (previous, current) =>
                        previous.themeMode != current.themeMode,
                    builder: (context, state) {
                      return Text(
                        state.themeMode.toString(),
                      );
                    },
                  ),
                ),
                10.verticalSpace,
                ElevatedButton(
                  onPressed: viewModel.getUser,
                  child: const Text("Get User"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

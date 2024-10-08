import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/di/injectable.dart';
import '../utils/constants/enums/app_enum.dart';
import '../utils/extensions/context_extension.dart';
import '../utils/extensions/num_extension.dart';
import '../utils/extensions/theme_extension.dart';
import '../viewmodels/app/network/network_bloc.dart';
import '../viewmodels/app/theme/theme_cubit.dart';
import '../viewmodels/ephemeral/main/main_view_cubit.dart';

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
                  onPressed: getIt<ThemeCubit>().toggleTheme,
                  child: Text(
                    context.watch<ThemeCubit>().state.appTheme.toString(),
                  ),
                ),
                10.verticalSpace,
                ElevatedButton(
                  onPressed: getIt<ThemeCubit>().toggleThemeMode,
                  child: Text(
                    context.watch<ThemeCubit>().state.themeMode.toString(),
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

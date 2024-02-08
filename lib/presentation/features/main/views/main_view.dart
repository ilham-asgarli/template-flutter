import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/extensions/num_extension.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../my-app/state/bloc/network/network_bloc.dart';
import '../../my-app/state/cubit/theme/theme_cubit.dart';
import '../view-models/main_view_model.dart';

class MainView extends StatelessWidget {
  final MainViewModel viewModel;

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
                  onPressed: viewModel.changeTheme,
                  child: Text(
                    context.watch<ThemeCubit>().state.appTheme.toString(),
                  ),
                ),
                10.verticalSpace,
                ElevatedButton(
                  onPressed: viewModel.changeThemeMode,
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

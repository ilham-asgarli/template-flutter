import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants/enums/app_enum.dart';
import '../../../utils/extensions/context_extension.dart';
import '../../../utils/extensions/num_extension.dart';
import '../../../utils/extensions/theme_extension.dart';
import '../../auth/viewmodels/auth_cubit.dart';
import '../../l10n/viewmodels/l10n_cubit.dart';
import '../../network/viewmodels/network_bloc.dart';
import '../../theme/viewmodels/theme_cubit.dart';
import '../viewmodels/settings_view_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsViewCubit viewModel =
        BlocProvider.of<SettingsViewCubit>(context);
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
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
                onPressed: BlocProvider.of<ThemeCubit>(context).toggleThemeMode,
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
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<L10nCubit>(context).changeLocale(
                    context.read<L10nCubit>().state.locale?.languageCode == "en"
                        ? const Locale("tr")
                        : const Locale("en"),
                  );
                },
                child: BlocBuilder<L10nCubit, L10nState>(
                  buildWhen: (previous, current) =>
                      previous.locale != current.locale,
                  builder: (context, state) {
                    return Text(
                      state.locale.toString(),
                    );
                  },
                ),
              ),
              10.verticalSpace,
              ElevatedButton(
                onPressed: viewModel.getUser,
                child: const Text("Get User"),
              ),
              10.verticalSpace,
              ElevatedButton(
                onPressed: authCubit.logout,
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

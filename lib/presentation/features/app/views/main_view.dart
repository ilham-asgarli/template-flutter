import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/extensions/context_extension.dart';
import '../viewmodels/main_view_cubit.dart';

class MainView extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const MainView({
    super.key,
    required this.child,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final MainViewCubit viewModel = BlocProvider.of<MainViewCubit>(context);

    return SafeArea(
      child: Scaffold(
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.calculateSelectedIndex(state.matchedLocation),
          onTap: (index) => viewModel.onTabTapped(context, index),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_rounded),
              label: context.l10n.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.notifications_rounded),
              label: context.l10n.notifications,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_rounded),
              label: context.l10n.settings,
            ),
          ],
        ),
      ),
    );
  }
}

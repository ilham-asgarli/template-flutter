import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

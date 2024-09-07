import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/di/injectable.dart';
import '../../../viewmodels/app/route/route_cubit.dart';
import '../../../views/main_view.dart';
import '../../../views/not_found_navigation_view.dart';
import '../../constants/app/app_constants.dart';
import '../../constants/router/router_constants.dart';

class AppRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  AppRouterDelegate() {
    getIt<RouteCubit>().stream.listen((route) {
      notifyListeners();
    });
  }

  @override
  List<RouteSettings>? get currentConfiguration => getIt<RouteCubit>().state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouteCubit, List<RouteSettings>>(
      builder: (context, stack) {
        return Navigator(
          key: navigatorKey,
          pages: _buildPages(stack),
          onDidRemovePage: _handlePopPage,
        );
      },
    );
  }

  List<Page> _buildPages(List<RouteSettings> stack) {
    return stack.map((routeSettings) {
      switch (routeSettings.name) {
        case RouterConstants.home:
          return MaterialPage(child: MainView(viewModel: getIt()));
        default:
          return const MaterialPage(child: NotFoundNavigationView());
      }
    }).toList();
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {
    getIt<RouteCubit>().replaceStackWith(configuration);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => AppConstants.navigatorKey;

  bool _handlePopPage(Page<Object?> page) {
    if (!page.canPop) {
      return false;
    }
    getIt<RouteCubit>().removeLastPage();
    return true;
  }
}

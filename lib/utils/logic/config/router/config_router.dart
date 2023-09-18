import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../presentation/features/main/views/main_view.dart';

part 'config_router.g.dart';

@TypedGoRoute<MainViewRoute>(
  path: '/',
  routes: [
    /*TypedGoRoute<SongRoute>(
      path: 'song/:id',
    ),*/
  ],
)
@immutable
class MainViewRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainView();
  }
}

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/di/injectable.dart';
import '../../../features/main/views/main_view.dart';
import '../../constants/router/router_constants.dart';

part 'config_router.g.dart';

@TypedGoRoute<MainViewRoute>(
  path: RouterConstants.home,
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
    return MainView(
      viewModel: getIt(),
    );
  }
}

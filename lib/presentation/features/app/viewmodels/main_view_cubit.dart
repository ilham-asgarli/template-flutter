import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/constants/router/router_constants.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(const MainViewState());

  int calculateSelectedIndex(String location) {
    switch (location) {
      case RouterConstants.home:
        return 0;
      case RouterConstants.notification:
        return 1;
      case RouterConstants.settings:
        return 2;
      default:
        return 0;
    }
  }

  void onTabTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(RouterConstants.home);
        break;
      case 1:
        context.go(RouterConstants.notification);
        break;
      case 2:
        context.go(RouterConstants.settings);
        break;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/constants/router/router_constants.dart';

@lazySingleton
class RouteCubit extends Cubit<List<RouteSettings>> {
  RouteCubit() : super([const RouteSettings(name: RouterConstants.home)]);

  void setNewRoutePath(String route) {
    emit([RouteSettings(name: route)]);
  }

  void addPage(String route) {
    final currentStack = List<RouteSettings>.from(state);
    currentStack.add(RouteSettings(name: route));
    emit(currentStack);
  }

  void removeLastPage() {
    if (state.length > 1) {
      final currentStack = List<RouteSettings>.from(state)..removeLast();
      emit(currentStack);
    }
  }

  void replaceStackWith(List<RouteSettings> newStack) {
    emit(newStack);
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/di/injectable.dart';

part 'my_app_view_state.dart';

@lazySingleton
class MyAppViewCubit extends Cubit<MyAppViewState> {
  MyAppViewCubit() : super(const MyAppViewState());

  void injectContext(BuildContext context) {
    try {
      getIt.registerLazySingleton(() => context);
    } catch (_) {}
  }
}

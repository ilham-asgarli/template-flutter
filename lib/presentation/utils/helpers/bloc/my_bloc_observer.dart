import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

import '../../../../utils/di/injectable.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    getIt<Logger>().d("Create: ${bloc.runtimeType}");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    getIt<Logger>().d("Close: ${bloc.runtimeType}");
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    getIt<Logger>()
        .e("Bloc: ${bloc.runtimeType}\nError: $error\nStackTrace: $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    getIt<Logger>().d(
        "Bloc: ${bloc.runtimeType}\nTransition: { currentState: ${transition.currentState.runtimeType}, event: ${transition.event.runtimeType}, nextState: ${transition.nextState.runtimeType} }");
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    getIt<Logger>().d(
        "Bloc: ${bloc.runtimeType}\nChange: { currentState: ${change.currentState.runtimeType}, nextState: ${change.nextState.runtimeType} }");
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    getIt<Logger>().d("Bloc: ${bloc.runtimeType}\nEvent: ${event.runtimeType}");
    super.onEvent(bloc, event);
  }
}

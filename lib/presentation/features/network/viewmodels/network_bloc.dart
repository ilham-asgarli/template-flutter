import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/constants/enums/app_enum.dart';

part 'network_bloc.freezed.dart';
part 'network_bloc.g.dart';
part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  late final StreamSubscription _subscription;
  final Connectivity _connectivity = Connectivity();

  NetworkBloc() : super(const NetworkState()) {
    on<Connect>(onConnect);
    on<FinishConnect>(onFinishConnect);

    listen();
  }

  void listen() {
    add(const Connect());
    _subscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      add(FinishConnect(connectivityResult: result));
    });
  }

  void onConnect(Connect event, Emitter<NetworkState> emit) {
    emit(state.copyWith(state: BlocState.loading));
  }

  void onFinishConnect(FinishConnect event, Emitter<NetworkState> emit) {
    if (event.connectivityResult.contains(ConnectivityResult.none)) {
      emit(state.copyWith(state: BlocState.error));
    } else {
      emit(state.copyWith(
        data: event.connectivityResult,
        state: BlocState.success,
      ));
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

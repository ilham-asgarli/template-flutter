import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'network_event.dart';
part 'network_state.dart';

@LazySingleton()
class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  late final StreamSubscription _subscription;
  final Connectivity _connectivity = Connectivity();

  NetworkBloc() : super(const NetworkInitial()) {
    on<Connect>(onConnect);
    on<FinishConnect>(onFinishConnect);

    listen();
  }

  void listen() {
    add(const Connect());
    _subscription = _connectivity.onConnectivityChanged.listen((
      ConnectivityResult result,
    ) {
      changeStateByConnectivityResult(result);
    });
  }

  void changeStateByConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.vpn:
      case ConnectivityResult.other:
        add(FinishConnect(connectivityResult: result));
        break;
      case ConnectivityResult.none:
        add(FinishConnect(connectivityResult: result));
        break;
    }
  }

  void onConnect(Connect event, Emitter<NetworkState> emit) {
    emit(const Connecting());
  }

  void onFinishConnect(FinishConnect event, Emitter<NetworkState> emit) {
    if (event.connectivityResult == ConnectivityResult.none) {
      emit(const ConnectionFailure());
    } else {
      emit(ConnectionSuccess(connectivityResult: event.connectivityResult));
    }
  }

  @disposeMethod
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

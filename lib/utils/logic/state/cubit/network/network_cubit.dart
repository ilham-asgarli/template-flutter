import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  StreamSubscription? _subscription;

  NetworkCubit() : super(NetworkInitial()) {
    startCheckConnectivityAndChangeState();
  }

  void startCheckConnectivityAndChangeState() async {
    await firstCheckConnectivityAndChangeState();
    subscribeToConnectivityResultAndChangeState();
  }

  Future<void> firstCheckConnectivityAndChangeState() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    changeStateByConnectivityResult(result);
  }

  void subscribeToConnectivityResultAndChangeState() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
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
        emit(
          ConnectionSuccess(
            connectivityResult: result,
          ),
        );
        break;
      case ConnectivityResult.none:
        emit(
          ConnectionFailure(),
        );
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

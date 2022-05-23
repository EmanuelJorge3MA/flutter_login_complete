import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_checker_state.dart';

class InternetCheckerCubit extends Cubit<InternetCheckerState> {
  final InternetConnectionChecker? internetConnectionChecker;
  StreamSubscription? internetConnectionStreamSubscription;

  InternetCheckerCubit({required this.internetConnectionChecker})
      : super(InternetCheckerLoading()) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() async {
    internetConnectionStreamSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          emitInternetConnected(InternetConnectionStatus.connected);
          break;
        case InternetConnectionStatus.disconnected:
          emitInternetDisconnected();
          break;
      }
    });
  }

  void emitInternetConnected(
          InternetConnectionStatus _internetConnectionStatus) =>
      emit(
        InternetCheckerConnected(
            internetConnectionStatus: _internetConnectionStatus),
      );

  void emitInternetDisconnected() => emit(InternetCheckerDisconnected());
}

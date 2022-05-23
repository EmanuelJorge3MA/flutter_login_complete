part of 'internet_checker_cubit.dart';

abstract class InternetCheckerState extends Equatable {
  const InternetCheckerState();

  @override
  List<Object> get props => [];
}

class InternetCheckerLoading extends InternetCheckerState {}

class InternetCheckerConnected extends InternetCheckerState {
  final InternetConnectionStatus? internetConnectionStatus;

  const InternetCheckerConnected({required this.internetConnectionStatus});
}

class InternetCheckerDisconnected extends InternetCheckerState {}

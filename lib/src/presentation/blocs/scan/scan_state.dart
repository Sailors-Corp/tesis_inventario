part of 'scan_cubit.dart';

sealed class ScanState extends Equatable {
  const ScanState({this.isCorrectPosition = false, this.percent = 0});

  // ignore: prefer_typing_uninitialized_variables
  final isCorrectPosition;
  final percent;

  @override
  List<Object> get props => [isCorrectPosition, percent];
}

final class ScanInitial extends ScanState {}

final class ScanLoading extends ScanState {}

final class ScanSuccess extends ScanState {
  @override
  final isCorrectPosition;

  const ScanSuccess(this.isCorrectPosition);
}

final class ScanSuccessPecent extends ScanState {
  @override
  final percent;

  const ScanSuccessPecent(this.percent);
}

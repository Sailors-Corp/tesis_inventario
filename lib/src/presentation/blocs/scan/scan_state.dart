part of 'scan_cubit.dart';

sealed class ScanState extends Equatable {
  const ScanState({this.isCorrectPosition = false});

  // ignore: prefer_typing_uninitialized_variables
  final isCorrectPosition;

  @override
  List<Object> get props => [isCorrectPosition];
}

final class ScanInitial extends ScanState {}

final class ScanLoading extends ScanState {}

final class ScanSuccess extends ScanState {
  @override
  final isCorrectPosition;

  const ScanSuccess(this.isCorrectPosition);
}

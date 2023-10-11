part of 'scan_cubit.dart';

sealed class ScanState extends Equatable {
  const ScanState({this.isCorrectPositon = false});

  final isCorrectPositon;

  @override
  List<Object> get props => [];
}

final class ScanInitial extends ScanState {}

final class ScanLoading extends ScanState {}

final class ScanSuccess extends ScanState {
  @override
  final isCorrectPositon;

  const ScanSuccess(this.isCorrectPositon);
}

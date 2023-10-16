part of 'scan_cubit.dart';

sealed class ScanState extends Equatable {
  const ScanState({this.correctPosition = ''});

  // ignore: prefer_typing_uninitialized_variables
  final String correctPosition;

  @override
  List<Object> get props => [correctPosition];
}

final class ScanInitial extends ScanState {}

final class ScanLoading extends ScanState {}

final class ScanError extends ScanState {
  final String message;

  const ScanError(this.message);
}

final class ScanSuccess extends ScanState {
  @override
  final String correctPosition;

  const ScanSuccess({required this.correctPosition});
}

final class ScanClosed extends ScanState {}

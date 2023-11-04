// ignore_for_file: overridden_fields

part of 'scan_cubit.dart';

sealed class ScanState extends Equatable {
  const ScanState({
    this.correctPosition = '',
    this.takeInv,
    this.percent = 0,
  });

  final double? percent;
  final bool? takeInv;
  final String? correctPosition;

  @override
  List<Object> get props => [correctPosition!, percent!, takeInv!];
}

final class ScanInitial extends ScanState {}

final class ScanClosed extends ScanState {}

final class ScanLoading extends ScanState {}

final class ScanSuccessPercent extends ScanState {
  @override
  final double? percent;
  @override
  final bool? takeInv;
  @override
  final String? correctPosition;

  const ScanSuccessPercent({
    this.takeInv,
    this.correctPosition,
    this.percent,
  });
}

final class ScanError extends ScanState {
  final String message;

  const ScanError(this.message);
}

final class ScanSuccess extends ScanState {
  @override
  final double? percent;
  @override
  final bool? takeInv;
  @override
  final String? correctPosition;

<<<<<<< HEAD
  const ScanSuccessPecent(double this.percent);
=======
  const ScanSuccess({
    this.takeInv,
    this.correctPosition,
    this.percent,
  });
>>>>>>> 4d3099019f0b5832677037e520d2f1ddf1ea9e1d
}

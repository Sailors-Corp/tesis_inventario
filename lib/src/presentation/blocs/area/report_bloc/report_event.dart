part of 'report_bloc.dart';

sealed class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  List<Object> get props => [];
}

class ReportExported extends ReportEvent {
  const ReportExported({
    required this.data,
    required this.area,
  });
  final List<MedioEntity> data;
  final String area;
}

class InventoryLoaded extends ReportEvent {}

part of 'medios_inventoried_bloc.dart';

sealed class MedioInventoriedEvent extends Equatable {
  const MedioInventoriedEvent();

  @override
  List<Object> get props => [];
}

class MediosInventoriedLoaded extends MedioInventoriedEvent {}

class MediosInventoriedClosed extends MedioInventoriedEvent {}

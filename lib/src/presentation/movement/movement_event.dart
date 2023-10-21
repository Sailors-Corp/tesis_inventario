part of 'movement_bloc.dart';

sealed class MovementEvent extends Equatable {
  const MovementEvent();

  @override
  List<Object> get props => [];
}

class MovementLoaded extends MovementEvent {
  final String? type;

  const MovementLoaded(this.type);
}



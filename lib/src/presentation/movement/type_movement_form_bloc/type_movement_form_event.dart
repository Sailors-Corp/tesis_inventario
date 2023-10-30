part of 'type_movement_form_bloc.dart';

sealed class TypeMovementFormEvent extends Equatable {
  const TypeMovementFormEvent();

  @override
  List<Object> get props => [];
}

class TypeChange extends TypeMovementFormEvent {
  final TypeMovement typeMovement;

  const TypeChange(this.typeMovement);
}

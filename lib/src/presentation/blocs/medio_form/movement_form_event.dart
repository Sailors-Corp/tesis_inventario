part of 'movement_form_bloc.dart';

sealed class MovementFormEvent extends Equatable {
  const MovementFormEvent();
}

final class ItemUpserted extends MovementFormEvent {
  const ItemUpserted({
    required this.movementFormEntity,
    this.medioId,
  });

  final String? medioId;
  final MovementFormEntity movementFormEntity;

  @override
  List<Object?> get props => [movementFormEntity, medioId];
}

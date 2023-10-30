part of 'movement_form_bloc.dart';

sealed class MovementFormEvent extends Equatable {
  const MovementFormEvent();
}

final class MovementUpserted extends MovementFormEvent {
  final MovementFormEntity movementFormEntity;
  final List<MedioEntity> medios;

  const MovementUpserted({
    required this.medios,
    required this.movementFormEntity,
  });

  @override
  List<Object?> get props => [
        movementFormEntity,
        medios,
      ];
}

// ignore_for_file: inference_failure_on_instance_creation

import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:inventory_tesis/src/domain/enums/type_movement.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'movement_form.gform.dart';

@Rf()
class MovementFormEntity extends Equatable {
  const MovementFormEntity({
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.entity = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.costCenter = '',
    this.description = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.name = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.role = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.type,
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.area = '',
  });

  factory MovementFormEntity.fromEntity(MovementEntity? entity) {
    if (entity == null) return const MovementFormEntity();
    return MovementFormEntity(
      area: entity.area,
      costCenter: entity.costCenter,
      description: entity.description,
      role: entity.role,
      name: entity.name,
      type: entity.type,
      entity: entity.entity,
    );
  }

  final String entity;
  final String costCenter;
  final String area;
  final String description;
  final String name;
  final String role;
  final TypeMovement? type;

  @override
  List<Object?> get props => [
        entity,
        costCenter,
        area,
        description,
        name,
        role,
        type,
      ];
}

import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:inventory_tesis/src/domain/enums/type_movement.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';

abstract final class MovementMapper {
  static MovementTableEntity modelToEntity(
      MovementFormEntity movementFormEntity, List<MedioEntity> medios) {
    return MovementTableEntity(
      area: movementFormEntity.area,
      costCenter: movementFormEntity.costCenter,
      description: movementFormEntity.description,
      role: movementFormEntity.role,
      name: movementFormEntity.name,
      type: movementFormEntity.type.toString(),
      entity: movementFormEntity.entity,
    );
  }

  static MovementEntity formToEntity(
      MovementFormEntity movementFormEntity, List<MedioEntity> medios) {
    return MovementEntity(
      area: movementFormEntity.area,
      costCenter: movementFormEntity.costCenter,
      description: movementFormEntity.description,
      role: movementFormEntity.role,
      name: movementFormEntity.name,
      type: movementFormEntity.type!,
      entity: movementFormEntity.entity,
      medios: medios,
    );
  }

  static MovementEntity entityToModel(List<MedioEntity> medios,
      MovementTableEntity entity, TypeMovement typeMovement) {
    return MovementEntity(
      entity: entity.entity,
      costCenter: entity.costCenter,
      area: entity.area,
      description: entity.description,
      name: entity.name,
      role: entity.role,
      type: typeMovement,
      medios: medios,
    );
  }
}

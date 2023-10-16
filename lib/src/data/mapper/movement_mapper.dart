import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';

abstract final class MovementMapper {
  static MovementTableEntity modelToEntity(
      MovementFormEntity movementFormEntity) {
    return MovementTableEntity(
      idMedio: movementFormEntity.idMedio,
      area: movementFormEntity.area,
      subclassification: movementFormEntity.subclassification,
      costCenter: movementFormEntity.costCenter,
      description: movementFormEntity.description,
      role: movementFormEntity.role,
      name: movementFormEntity.name,
      type: movementFormEntity.type,
      entity: movementFormEntity.entity,
    );
  }

  // static MedioBasicoTableEntity formToModel(
  //   MedioEntity medio,
  // ) {
  //   return MedioBasicoTableEntity(
  //     rotulo: medio.rotulo,
  //     area: medio.area,
  //     subclassification: medio.subclassification,
  //   );
  // }
}

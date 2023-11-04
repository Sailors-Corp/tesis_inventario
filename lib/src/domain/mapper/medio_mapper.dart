import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/presentation/forms/medio_form.dart';

abstract final class MedioMapper {
  static MedioEntity tableToEntity(MedioBasicoTableEntity medio, int cant) {
    return MedioEntity(
        rotulo: medio.rotulo,
        area: medio.area,
        subclassification: medio.subclassification,
        cant: cant);
  }

  static MedioBasicoTableEntity entityToTable(MedioEntity medio, int id) {
    return MedioBasicoTableEntity(
      rotulo: medio.rotulo,
      movementId: id,
      area: medio.area,
      subclassification: medio.subclassification,
    );
  }

  static MedioEntity formToEntity(MedioFormEntity medioFormEntity) {
    return MedioEntity(
        rotulo: medioFormEntity.rotulo,
        area: medioFormEntity.area,
        subclassification: medioFormEntity.subclassification,
        cant: 0);
  }
}

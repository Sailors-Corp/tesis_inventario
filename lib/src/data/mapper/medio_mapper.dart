import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';

abstract final class MedioMapper {
  static MedioEntity modelToEntity(MedioBasicoTableEntity medio, int cant) {
    return MedioEntity(
        rotulo: medio.rotulo,
        area: medio.area,
        subclassification: medio.subclassification,
        cant: cant);
  }

  static MedioBasicoTableEntity formToModel(
    MedioEntity medio,
  ) {
    return MedioBasicoTableEntity(
      rotulo: medio.rotulo,
      area: medio.area,
      subclassification: medio.subclassification,
    );
  }
}

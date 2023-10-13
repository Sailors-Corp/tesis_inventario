import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';

abstract final class MedioMapper {
  static MedioEntity modelToEntity(MedioBasicoEntity medio, int cant) {
    return MedioEntity(
        rotulo: medio.rotulo,
        area: medio.area,
        subclassification: medio.subclasification,
        cant: cant);
  }

  // static MedioFormModel formToModel(
  //   ItemFormEntity formEntity,
  // ) {
  //   return MedioFormModel(
  //     name: formEntity.name,
  //     stock: formEntity.stock,
  //     imageUrl: formEntity.imagePath,
  //     price: formEntity.price,
  //   );
  // }
}

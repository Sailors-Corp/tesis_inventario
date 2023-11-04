import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/entities/inventory_entity.dart';

abstract final class InventoryMapper {
  static InventoryEntity tableToEntity(
      List<InventarioTableEntity> correctMedios,
      List<InventarioTableEntity> incorrectMedios) {
    return InventoryEntity(
      correctMedios: correctMedios,
      incorrectMedios: incorrectMedios,
    );
  }
}

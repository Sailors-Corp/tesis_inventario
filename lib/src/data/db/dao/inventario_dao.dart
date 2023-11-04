import 'package:drift/drift.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/db/table/inventory_table.dart';

part 'inventario_dao.g.dart';

// Denote which tables this DAO can access
@DriftAccessor(tables: [Inventario])
class InvDao extends DatabaseAccessor<AppDatabase> with _$InvDaoMixin {
  InvDao(super.attachedDatabase);

  Future<void> insertInv(InventarioTableEntity inventarioTableEntity) async {
    await into(inventario).insertOnConflictUpdate(inventarioTableEntity);
  }

  Future<void> deleteAllInventory() async {
    await delete(inventario).go();
  }

  Future<void> deleteInv(String rotulo) async {
    await (delete(inventario)..where((tbl) => tbl.rotulo.equals(rotulo))).go();
  }

  Future<List<InventarioTableEntity>> getAllInventory() async {
    return await select(inventario).get();
  }

  Future<List<InventarioTableEntity>>
      getMediosInventoriedInIncorrectArea() async {
    return await (select(inventario)
          ..where((tbl) => tbl.isCorrectPosition.equals(false)))
        .get();
  }

  Future<List<InventarioTableEntity>>
      getMediosInventoriedInCorrectArea() async {
    return await (select(inventario)
          ..where((tbl) => tbl.isCorrectPosition.equals(true)))
        .get();
  }

  Future<List<InventarioTableEntity>> getInventoryByArea(String area) async {
    return await (select(inventario)..where((tbl) => tbl.area.equals(area)))
        .get();
  }
  Future<void> deleteAllInv() async {
    await delete(inventario).go();
  }

  Future<List<InventarioTableEntity>> getInventoryBySubclassification(
      String subclassification) async {
    return await (select(inventario)
          ..where((tbl) => tbl.classification.equals(subclassification)))
        .get();
  }
}

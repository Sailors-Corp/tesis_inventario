import 'package:drift/drift.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/db/table/inventory_table.dart';

part 'inventario_dao.g.dart';

// Denote which tables this DAO can access
@DriftAccessor(tables: [Inventario])
class InvDao extends DatabaseAccessor<AppDatabase> with _$InvDaoMixin {
  InvDao(super.attachedDatabase);

  Future<void> insertInvs(List<InventarioEntity> mbInventario) async {
    await inventario.insertAll(mbInventario);
  }

  Future<void> insertInv(InventarioEntity inventarioTableEntity) async {
    await into(inventario).insertOnConflictUpdate(inventarioTableEntity);
  }

  Future<void> deleteAllInvs() async {
    await delete(inventario).go();
  }

  Future<void> deleteInv(String rotulo) async {
    await (delete(inventario)..where((tbl) => tbl.rotulo.equals(rotulo))).go();
  }

  Future<void> updateInv(InventarioEntity inventarioTableEntity) async {
    await update(inventario).replace(inventarioTableEntity);
  }

  Future<void> updateInvs(List<InventarioEntity> mbInventario) async {
    await batch((batch) {
      batch.insertAll(inventario, mbInventario, mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<InventarioEntity>> getAllInvs() async {
    return await select(inventario).get();
  }

  Future<List<String?>> getAreas() async {
    return await (selectOnly(inventario, distinct: true)
          ..addColumns([inventario.area]))
        .map((row) => row.read(inventario.area))
        .get();
  }

  Future<List<InventarioEntity>> getInvsByArea(String area) async {
    return await (select(inventario)..where((tbl) => tbl.area.equals(area)))
        .get();
  }

  Future<List<InventarioEntity>> getInvsBySubclassification(
      String subclassification) async {
    return await (select(inventario)
          ..where((tbl) => tbl.subclasification.equals(subclassification)))
        .get();
  }

  Future<int> getCantInvsByAreaAndSubclassification(
      String area, String subclassification) async {
    final response = await (select(inventario)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.subclasification.equals(subclassification)))
        .get();
    final cant = response.length;
    return cant;
  }

  Future<List<InventarioEntity>> getInvsByAreaAndSubclassificationAndRotulo(
      String area, String subclassification, String rotulo) async {
    return await (select(inventario)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.subclasification.equals(subclassification))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<List<InventarioEntity>> getInvsByAreaAndRotulo(
      String area, String rotulo) async {
    return await (select(inventario)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<List<InventarioEntity>> getInvsBySubclassificationAndRotulo(
      String subclassification, String rotulo) async {
    return await (select(inventario)
          ..where((tbl) => tbl.subclasification.equals(subclassification))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<InventarioEntity?> getInvsByRotulo(String rotulo) async {
    return await (select(inventario)
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .getSingleOrNull();
  }
}

import 'package:drift/drift.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/db/table/medio_table.dart';

part 'dao.g.dart';

// Denote which tables this DAO can access
@DriftAccessor(tables: [MedioBasico])
class MBDao extends DatabaseAccessor<AppDatabase> with _$MBDaoMixin {
  MBDao(super.attachedDatabase);

  Future<void> insertMBs(List<MedioBasicoEntity> medios) async {
    await medioBasico.insertAll(medios);
  }

  Future<void> insertMB(MedioBasicoEntity medioTableEntity) async {
    await into(medioBasico).insertOnConflictUpdate(medioTableEntity);
  }

  Future<void> deleteAllMBs() async {
    await delete(medioBasico).go();
  }

  Future<void> deleteMB(String rotulo) async {
    await (delete(medioBasico)..where((tbl) => tbl.rotulo.equals(rotulo))).go();
  }

  Future<void> updateMB(MedioBasicoEntity medioTableEntity) async {
    await update(medioBasico).replace(medioTableEntity);
  }

  Future<void> updateMBs(List<MedioBasicoEntity> medios) async {
    await batch((batch) {
      batch.insertAll(medioBasico, medios, mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<MedioBasicoEntity>> getAllMBs() async {
    return await select(medioBasico).get();
  }

  Future<List<String?>> getAreas() async {
    return await (selectOnly(medioBasico, distinct: true)
          ..addColumns([medioBasico.area]))
        .map((row) => row.read(medioBasico.area))
        .get();
  }

  Future<List<MedioBasicoEntity>> getMBsByArea(String area) async {
    return await (select(medioBasico)..where((tbl) => tbl.area.equals(area)))
        .get();
  }

  Future<List<MedioBasicoEntity>> getMBsBySubclassification(
      String subclassification) async {
    return await (select(medioBasico)
          ..where((tbl) => tbl.subclasification.equals(subclassification)))
        .get();
  }

  Future<int> getCantMBsByAreaAndSubclassification(
      String area, String subclassification) async {
    final response = await (select(medioBasico)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.subclasification.equals(subclassification)))
        .get();
    final cant = response.length;
    return cant;
  }

  Future<List<MedioBasicoEntity>> getMBsByAreaAndSubclassificationAndRotulo(
      String area, String subclassification, String rotulo) async {
    return await (select(medioBasico)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.subclasification.equals(subclassification))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<List<MedioBasicoEntity>> getMBsByAreaAndRotulo(
      String area, String rotulo) async {
    return await (select(medioBasico)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<List<MedioBasicoEntity>> getMBsBySubclassificationAndRotulo(
      String subclassification, String rotulo) async {
    return await (select(medioBasico)
          ..where((tbl) => tbl.subclasification.equals(subclassification))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<MedioBasicoEntity?> getMBsByRotulo(String rotulo) async {
    return await (select(medioBasico)
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .getSingleOrNull();
  }
}

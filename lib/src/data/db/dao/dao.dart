import 'package:drift/drift.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/db/table/medio_table.dart';

part 'dao.g.dart';

// Denote which tables this DAO can access
@DriftAccessor(tables: [MBTable])
class MBDao extends DatabaseAccessor<AppDatabase> with _$MBDaoMixin {
  MBDao(super.attachedDatabase);

  Future<void> insertMBs(List<MBTableEntity> medios) async {
    await mBTable.insertAll(medios);
  }

  Future<void> insertMB(MBTableEntity medioTableEntity) async {
    await into(mBTable).insertOnConflictUpdate(medioTableEntity);
  }

  Future<void> deleteAllMBs() async {
    await delete(mBTable).go();
  }

  Future<void> deleteMB(String rotulo) async {
    await (delete(mBTable)..where((tbl) => tbl.rotulo.equals(rotulo))).go();
  }

  Future<void> updateMB(MBTableEntity medioTableEntity) async {
    await update(mBTable).replace(medioTableEntity);
  }

  Future<void> updateMBs(List<MBTableEntity> medios) async {
    await batch((batch) {
      batch.insertAll(mBTable, medios, mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<MBTableEntity>> getAllMBs() async {
    return await select(mBTable).get();
  }

  Future<List<MBTableEntity>> getMBsByArea(String area) async {
    return await (select(mBTable)..where((tbl) => tbl.area.equals(area))).get();
  }

  Future<List<MBTableEntity>> getMBsBySubclasification(
      String subclasification) async {
    return await (select(mBTable)
          ..where((tbl) => tbl.subclasification.equals(subclasification)))
        .get();
  }

  Future<List<MBTableEntity>> getMBsByAreaAndSubclasification(
      String area, String subclasification) async {
    return await (select(mBTable)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.subclasification.equals(subclasification)))
        .get();
  }

  Future<List<MBTableEntity>> getMBsByAreaAndSubclasificationAndRotulo(
      String area, String subclasification, String rotulo) async {
    return await (select(mBTable)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.subclasification.equals(subclasification))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<List<MBTableEntity>> getMBsByAreaAndRotulo(
      String area, String rotulo) async {
    return await (select(mBTable)
          ..where((tbl) => tbl.area.equals(area))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<List<MBTableEntity>> getMBsBySubclasificationAndRotulo(
      String subclasification, String rotulo) async {
    return await (select(mBTable)
          ..where((tbl) => tbl.subclasification.equals(subclasification))
          ..where((tbl) => tbl.rotulo.equals(rotulo)))
        .get();
  }

  Future<MBTableEntity?> getMBsByRotulo(String rotulo) async {
    return await (select(mBTable)..where((tbl) => tbl.rotulo.equals(rotulo)))
        .getSingleOrNull();
  }
}

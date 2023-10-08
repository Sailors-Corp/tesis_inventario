import 'package:drift/drift.dart';
import 'package:inventory_tesis/features/data/db/database.dart';
import 'package:inventory_tesis/features/data/db/table/medio_table.dart';

part 'dao.g.dart';

// Denote which tables this DAO can access
@DriftAccessor(tables: [MedioTable])
class MedioDao extends DatabaseAccessor<AppDatabase> with _$MedioDaoMixin {
  MedioDao(super.attachedDatabase);

  Future<void> insertMedios(List<MedioTableEntity> medios) async {
    await medioTable.insertAll(medios);
  }

  Future<void> insertMedio(MedioTableEntity medioTableEntity) async {
    await into(medioTable).insertOnConflictUpdate(medioTableEntity);
  }

  Stream<List<MedioTableEntity>> wacthAllMedios() {
    return (select(medioTable)
          ..orderBy([
            (u) => OrderingTerm(mode: OrderingMode.asc, expression: u.rotulo)
          ]))
        .watch();
  }

  // Future<List<MedioTableEntity>> getAllGroups() {
  //   return (select(group)
  //         ..orderBy([
  //           (u) => OrderingTerm(expression: u.startDate, mode: OrderingMode.asc)
  //         ]))
  //       .get();
  // }

  // Future<List<MedioTableEntity>> getAllOpenGroups() {
  //   return (select(group)
  //         ..where((tbl) => tbl.type.equals("abierto"))
  //         ..orderBy([
  //           (u) => OrderingTerm(expression: u.startDate, mode: OrderingMode.asc)
  //         ]))
  //       .get();
  // }

  // Future<MedioTableEntity?> getGroupById(String groupId) async {
  //   return (select(group)..where((tbl) => tbl.id.equals(groupId)))
  //       .getSingleOrNull();
  // }

  // Stream<MedioTableEntity?> watchGroupById(String groupId) {
  //   return (select(group)..where((tbl) => tbl.id.equals(groupId)))
  //       .watchSingleOrNull();
  // }

  // Future<void> deleteAllGroups() async {
  //   await delete(group).go();
  // }

  // Future<List<MedioTableEntity>> getAllClosedGroups() {
  //   return (select(group)
  //         ..where((tbl) => tbl.type.equals("cerrado"))
  //         ..orderBy([
  //           (u) => OrderingTerm(expression: u.startDate, mode: OrderingMode.asc)
  //         ]))
  //       .get();
  // }

  // Future<void> removeAllClosedGroups() async {
  //   await (delete(group)
  //         ..where(
  //           (tbl) => tbl.type.equals('cerrado'),
  //         ))
  //       .go();
  // }
}

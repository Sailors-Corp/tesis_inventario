import 'package:drift/drift.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/db/table/movement_table.dart';

part 'movement_dao.g.dart';

// Denote which tables this DAO can access
@DriftAccessor(tables: [Movement])
class MovementDao extends DatabaseAccessor<AppDatabase>
    with _$MovementDaoMixin {
  MovementDao(super.attachedDatabase);

  Future<void> insertMB(MovementTableEntity movementTableEntity) async {
    await into(movement).insertOnConflictUpdate(movementTableEntity);
  }
}

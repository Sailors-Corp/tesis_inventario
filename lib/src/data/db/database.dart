import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:inventory_tesis/src/data/db/dao/medio_dao.dart';
import 'package:inventory_tesis/src/data/db/dao/movement_dao.dart';
import 'package:inventory_tesis/src/data/mapper/medio_table.dart';
import 'package:inventory_tesis/src/data/db/table/movement_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {

  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    MedioBasico,
    Movement,
  ],
  daos: [
    MedioBasicoDao,
    MovementDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

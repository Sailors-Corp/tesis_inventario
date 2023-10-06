import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:inventory_tesis/features/data/db/table/area_table.dart';
import 'package:inventory_tesis/features/data/db/table/medio_table.dart';
import 'package:inventory_tesis/src/presentation/generated/assets/assets.gen.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load(Assets.db.inventario);
      final bytes =
          blob.buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes);
      await file.writeAsBytes(bytes);
    }

    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    AreaTable,
    MedioTable,
  ],
  daos: [],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

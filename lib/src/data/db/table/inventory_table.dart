import 'package:drift/drift.dart';

@DataClassName('InventarioTableEntity')
class Inventario extends Table {
  TextColumn get rotulo => text()();

  TextColumn get area => text()();

  TextColumn get classification => text()();

  BoolColumn? get isCorrectPosition => boolean().nullable()();

  TextColumn? get correctPosition => text().nullable()();

  @override
  Set<Column> get primaryKey => {rotulo};
}

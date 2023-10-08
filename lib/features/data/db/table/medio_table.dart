import 'package:drift/drift.dart';

@DataClassName('MedioTableEntity')
class MedioTable extends Table {
  TextColumn get rotulo => text()();

  TextColumn get area => text()();

  TextColumn get subclasification => text()();

  @override
  Set<Column> get primaryKey => {rotulo};
}

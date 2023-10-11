import 'package:drift/drift.dart';

@DataClassName('MBTableEntity')
class MBTable extends Table {
  TextColumn get rotulo => text()();

  TextColumn get area => text()();

  TextColumn get subclasification => text()();

  @override
  Set<Column> get primaryKey => {rotulo};
}

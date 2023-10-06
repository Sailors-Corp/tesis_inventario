import 'package:drift/drift.dart';

@DataClassName('MedioTableEntity')
class MedioTable extends Table {
  TextColumn get rotulo => text()();

  TextColumn get name => text()();

  TextColumn get subclasificaion => text()();

  @override
  Set<Column> get primaryKey => {rotulo};
}

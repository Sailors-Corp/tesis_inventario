import 'package:drift/drift.dart';

@DataClassName('MedioBasicoTableEntity')
class MedioBasico extends Table {
  TextColumn get rotulo => text()();

  TextColumn get area => text()();

  TextColumn get subclassification => text()();

  @override
  Set<Column> get primaryKey => {rotulo};
}

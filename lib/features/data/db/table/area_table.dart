import 'package:drift/drift.dart';

@DataClassName('AreaTableEntity')
class AreaTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

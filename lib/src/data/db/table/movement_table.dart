import 'package:drift/drift.dart';

@DataClassName('MovementTableEntity')
class Movement extends Table {
  IntColumn? get id => integer().autoIncrement().nullable()();

  TextColumn get entity => text()();

  TextColumn get costCenter => text()();

  TextColumn get area => text()();

  TextColumn get description => text()();

  TextColumn get name => text()();

  TextColumn get role => text()();

  TextColumn get type => text()();

}

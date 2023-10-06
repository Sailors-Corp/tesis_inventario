// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AreaTableTable extends AreaTable
    with TableInfo<$AreaTableTable, AreaTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AreaTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
      'time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, date, dateCreate, time, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'area_table';
  @override
  VerificationContext validateIntegrity(Insertable<AreaTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AreaTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AreaTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create']),
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
    );
  }

  @override
  $AreaTableTable createAlias(String alias) {
    return $AreaTableTable(attachedDatabase, alias);
  }
}

class AreaTableEntity extends DataClass implements Insertable<AreaTableEntity> {
  final int id;
  final String name;
  final String date;
  final DateTime? dateCreate;
  final String time;
  final String address;
  const AreaTableEntity(
      {required this.id,
      required this.name,
      required this.date,
      this.dateCreate,
      required this.time,
      required this.address});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || dateCreate != null) {
      map['date_create'] = Variable<DateTime>(dateCreate);
    }
    map['time'] = Variable<String>(time);
    map['address'] = Variable<String>(address);
    return map;
  }

  AreaTableCompanion toCompanion(bool nullToAbsent) {
    return AreaTableCompanion(
      id: Value(id),
      name: Value(name),
      date: Value(date),
      dateCreate: dateCreate == null && nullToAbsent
          ? const Value.absent()
          : Value(dateCreate),
      time: Value(time),
      address: Value(address),
    );
  }

  factory AreaTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AreaTableEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<String>(json['date']),
      dateCreate: serializer.fromJson<DateTime?>(json['dateCreate']),
      time: serializer.fromJson<String>(json['time']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<String>(date),
      'dateCreate': serializer.toJson<DateTime?>(dateCreate),
      'time': serializer.toJson<String>(time),
      'address': serializer.toJson<String>(address),
    };
  }

  AreaTableEntity copyWith(
          {int? id,
          String? name,
          String? date,
          Value<DateTime?> dateCreate = const Value.absent(),
          String? time,
          String? address}) =>
      AreaTableEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        dateCreate: dateCreate.present ? dateCreate.value : this.dateCreate,
        time: time ?? this.time,
        address: address ?? this.address,
      );
  @override
  String toString() {
    return (StringBuffer('AreaTableEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('time: $time, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, date, dateCreate, time, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AreaTableEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.date == this.date &&
          other.dateCreate == this.dateCreate &&
          other.time == this.time &&
          other.address == this.address);
}

class AreaTableCompanion extends UpdateCompanion<AreaTableEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> date;
  final Value<DateTime?> dateCreate;
  final Value<String> time;
  final Value<String> address;
  final Value<int> rowid;
  const AreaTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.time = const Value.absent(),
    this.address = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AreaTableCompanion.insert({
    required int id,
    required String name,
    required String date,
    this.dateCreate = const Value.absent(),
    required String time,
    required String address,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        date = Value(date),
        time = Value(time),
        address = Value(address);
  static Insertable<AreaTableEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? date,
    Expression<DateTime>? dateCreate,
    Expression<String>? time,
    Expression<String>? address,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (dateCreate != null) 'date_create': dateCreate,
      if (time != null) 'time': time,
      if (address != null) 'address': address,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AreaTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? date,
      Value<DateTime?>? dateCreate,
      Value<String>? time,
      Value<String>? address,
      Value<int>? rowid}) {
    return AreaTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      dateCreate: dateCreate ?? this.dateCreate,
      time: time ?? this.time,
      address: address ?? this.address,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AreaTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('time: $time, ')
          ..write('address: $address, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedioTableTable extends MedioTable
    with TableInfo<$MedioTableTable, MedioTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedioTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateCreateMeta =
      const VerificationMeta('dateCreate');
  @override
  late final GeneratedColumn<DateTime> dateCreate = GeneratedColumn<DateTime>(
      'date_create', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, dateCreate, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medio_table';
  @override
  VerificationContext validateIntegrity(Insertable<MedioTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date_create')) {
      context.handle(
          _dateCreateMeta,
          dateCreate.isAcceptableOrUnknown(
              data['date_create']!, _dateCreateMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedioTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedioTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dateCreate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_create']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $MedioTableTable createAlias(String alias) {
    return $MedioTableTable(attachedDatabase, alias);
  }
}

class MedioTableEntity extends DataClass
    implements Insertable<MedioTableEntity> {
  final int id;
  final DateTime? dateCreate;
  final String name;
  const MedioTableEntity(
      {required this.id, this.dateCreate, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || dateCreate != null) {
      map['date_create'] = Variable<DateTime>(dateCreate);
    }
    map['name'] = Variable<String>(name);
    return map;
  }

  MedioTableCompanion toCompanion(bool nullToAbsent) {
    return MedioTableCompanion(
      id: Value(id),
      dateCreate: dateCreate == null && nullToAbsent
          ? const Value.absent()
          : Value(dateCreate),
      name: Value(name),
    );
  }

  factory MedioTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedioTableEntity(
      id: serializer.fromJson<int>(json['id']),
      dateCreate: serializer.fromJson<DateTime?>(json['dateCreate']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateCreate': serializer.toJson<DateTime?>(dateCreate),
      'name': serializer.toJson<String>(name),
    };
  }

  MedioTableEntity copyWith(
          {int? id,
          Value<DateTime?> dateCreate = const Value.absent(),
          String? name}) =>
      MedioTableEntity(
        id: id ?? this.id,
        dateCreate: dateCreate.present ? dateCreate.value : this.dateCreate,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('MedioTableEntity(')
          ..write('id: $id, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateCreate, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedioTableEntity &&
          other.id == this.id &&
          other.dateCreate == this.dateCreate &&
          other.name == this.name);
}

class MedioTableCompanion extends UpdateCompanion<MedioTableEntity> {
  final Value<int> id;
  final Value<DateTime?> dateCreate;
  final Value<String> name;
  const MedioTableCompanion({
    this.id = const Value.absent(),
    this.dateCreate = const Value.absent(),
    this.name = const Value.absent(),
  });
  MedioTableCompanion.insert({
    this.id = const Value.absent(),
    this.dateCreate = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<MedioTableEntity> custom({
    Expression<int>? id,
    Expression<DateTime>? dateCreate,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateCreate != null) 'date_create': dateCreate,
      if (name != null) 'name': name,
    });
  }

  MedioTableCompanion copyWith(
      {Value<int>? id, Value<DateTime?>? dateCreate, Value<String>? name}) {
    return MedioTableCompanion(
      id: id ?? this.id,
      dateCreate: dateCreate ?? this.dateCreate,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateCreate.present) {
      map['date_create'] = Variable<DateTime>(dateCreate.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedioTableCompanion(')
          ..write('id: $id, ')
          ..write('dateCreate: $dateCreate, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $AreaTableTable areaTable = $AreaTableTable(this);
  late final $MedioTableTable medioTable = $MedioTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [areaTable, medioTable];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MBTableTable extends MBTable
    with TableInfo<$MBTableTable, MBTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MBTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rotuloMeta = const VerificationMeta('rotulo');
  @override
  late final GeneratedColumn<String> rotulo = GeneratedColumn<String>(
      'rotulo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
      'area', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subclasificationMeta =
      const VerificationMeta('subclasification');
  @override
  late final GeneratedColumn<String> subclasification = GeneratedColumn<String>(
      'subclasification', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [rotulo, area, subclasification];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'm_b_table';
  @override
  VerificationContext validateIntegrity(Insertable<MBTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('rotulo')) {
      context.handle(_rotuloMeta,
          rotulo.isAcceptableOrUnknown(data['rotulo']!, _rotuloMeta));
    } else if (isInserting) {
      context.missing(_rotuloMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('subclasification')) {
      context.handle(
          _subclasificationMeta,
          subclasification.isAcceptableOrUnknown(
              data['subclasification']!, _subclasificationMeta));
    } else if (isInserting) {
      context.missing(_subclasificationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rotulo};
  @override
  MBTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MBTableEntity(
      rotulo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rotulo'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!,
      subclasification: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}subclasification'])!,
    );
  }

  @override
  $MBTableTable createAlias(String alias) {
    return $MBTableTable(attachedDatabase, alias);
  }
}

class MBTableEntity extends DataClass implements Insertable<MBTableEntity> {
  final String rotulo;
  final String area;
  final String subclasification;
  const MBTableEntity(
      {required this.rotulo,
      required this.area,
      required this.subclasification});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rotulo'] = Variable<String>(rotulo);
    map['area'] = Variable<String>(area);
    map['subclasification'] = Variable<String>(subclasification);
    return map;
  }

  MBTableCompanion toCompanion(bool nullToAbsent) {
    return MBTableCompanion(
      rotulo: Value(rotulo),
      area: Value(area),
      subclasification: Value(subclasification),
    );
  }

  factory MBTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MBTableEntity(
      rotulo: serializer.fromJson<String>(json['rotulo']),
      area: serializer.fromJson<String>(json['area']),
      subclasification: serializer.fromJson<String>(json['subclasification']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rotulo': serializer.toJson<String>(rotulo),
      'area': serializer.toJson<String>(area),
      'subclasification': serializer.toJson<String>(subclasification),
    };
  }

  MBTableEntity copyWith(
          {String? rotulo, String? area, String? subclasification}) =>
      MBTableEntity(
        rotulo: rotulo ?? this.rotulo,
        area: area ?? this.area,
        subclasification: subclasification ?? this.subclasification,
      );
  @override
  String toString() {
    return (StringBuffer('MBTableEntity(')
          ..write('rotulo: $rotulo, ')
          ..write('area: $area, ')
          ..write('subclasification: $subclasification')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(rotulo, area, subclasification);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MBTableEntity &&
          other.rotulo == this.rotulo &&
          other.area == this.area &&
          other.subclasification == this.subclasification);
}

class MBTableCompanion extends UpdateCompanion<MBTableEntity> {
  final Value<String> rotulo;
  final Value<String> area;
  final Value<String> subclasification;
  final Value<int> rowid;
  const MBTableCompanion({
    this.rotulo = const Value.absent(),
    this.area = const Value.absent(),
    this.subclasification = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MBTableCompanion.insert({
    required String rotulo,
    required String area,
    required String subclasification,
    this.rowid = const Value.absent(),
  })  : rotulo = Value(rotulo),
        area = Value(area),
        subclasification = Value(subclasification);
  static Insertable<MBTableEntity> custom({
    Expression<String>? rotulo,
    Expression<String>? area,
    Expression<String>? subclasification,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (rotulo != null) 'rotulo': rotulo,
      if (area != null) 'area': area,
      if (subclasification != null) 'subclasification': subclasification,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MBTableCompanion copyWith(
      {Value<String>? rotulo,
      Value<String>? area,
      Value<String>? subclasification,
      Value<int>? rowid}) {
    return MBTableCompanion(
      rotulo: rotulo ?? this.rotulo,
      area: area ?? this.area,
      subclasification: subclasification ?? this.subclasification,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rotulo.present) {
      map['rotulo'] = Variable<String>(rotulo.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (subclasification.present) {
      map['subclasification'] = Variable<String>(subclasification.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MBTableCompanion(')
          ..write('rotulo: $rotulo, ')
          ..write('area: $area, ')
          ..write('subclasification: $subclasification, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MBTableTable mBTable = $MBTableTable(this);
  late final MBDao mBDao = MBDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [mBTable];
}

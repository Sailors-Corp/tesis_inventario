// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MedioBasicoTable extends MedioBasico
    with TableInfo<$MedioBasicoTable, MedioBasicoTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedioBasicoTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _subclassificationMeta =
      const VerificationMeta('subclassification');
  @override
  late final GeneratedColumn<String> subclassification =
      GeneratedColumn<String>('subclassification', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _movementIdMeta =
      const VerificationMeta('movementId');
  @override
  late final GeneratedColumn<int> movementId = GeneratedColumn<int>(
      'movement_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [rotulo, area, subclassification, movementId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medio_basico';
  @override
  VerificationContext validateIntegrity(
      Insertable<MedioBasicoTableEntity> instance,
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
    if (data.containsKey('subclassification')) {
      context.handle(
          _subclassificationMeta,
          subclassification.isAcceptableOrUnknown(
              data['subclassification']!, _subclassificationMeta));
    } else if (isInserting) {
      context.missing(_subclassificationMeta);
    }
    if (data.containsKey('movement_id')) {
      context.handle(
          _movementIdMeta,
          movementId.isAcceptableOrUnknown(
              data['movement_id']!, _movementIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rotulo};
  @override
  MedioBasicoTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedioBasicoTableEntity(
      rotulo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rotulo'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!,
      subclassification: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}subclassification'])!,
      movementId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movement_id']),
    );
  }

  @override
  $MedioBasicoTable createAlias(String alias) {
    return $MedioBasicoTable(attachedDatabase, alias);
  }
}

class MedioBasicoTableEntity extends DataClass
    implements Insertable<MedioBasicoTableEntity> {
  final String rotulo;
  final String area;
  final String subclassification;
  final int? movementId;
  const MedioBasicoTableEntity(
      {required this.rotulo,
      required this.area,
      required this.subclassification,
      this.movementId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rotulo'] = Variable<String>(rotulo);
    map['area'] = Variable<String>(area);
    map['subclassification'] = Variable<String>(subclassification);
    if (!nullToAbsent || movementId != null) {
      map['movement_id'] = Variable<int>(movementId);
    }
    return map;
  }

  MedioBasicoCompanion toCompanion(bool nullToAbsent) {
    return MedioBasicoCompanion(
      rotulo: Value(rotulo),
      area: Value(area),
      subclassification: Value(subclassification),
      movementId: movementId == null && nullToAbsent
          ? const Value.absent()
          : Value(movementId),
    );
  }

  factory MedioBasicoTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedioBasicoTableEntity(
      rotulo: serializer.fromJson<String>(json['rotulo']),
      area: serializer.fromJson<String>(json['area']),
      subclassification: serializer.fromJson<String>(json['subclassification']),
      movementId: serializer.fromJson<int?>(json['movementId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rotulo': serializer.toJson<String>(rotulo),
      'area': serializer.toJson<String>(area),
      'subclassification': serializer.toJson<String>(subclassification),
      'movementId': serializer.toJson<int?>(movementId),
    };
  }

  MedioBasicoTableEntity copyWith(
          {String? rotulo,
          String? area,
          String? subclassification,
          Value<int?> movementId = const Value.absent()}) =>
      MedioBasicoTableEntity(
        rotulo: rotulo ?? this.rotulo,
        area: area ?? this.area,
        subclassification: subclassification ?? this.subclassification,
        movementId: movementId.present ? movementId.value : this.movementId,
      );
  @override
  String toString() {
    return (StringBuffer('MedioBasicoTableEntity(')
          ..write('rotulo: $rotulo, ')
          ..write('area: $area, ')
          ..write('subclassification: $subclassification, ')
          ..write('movementId: $movementId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(rotulo, area, subclassification, movementId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedioBasicoTableEntity &&
          other.rotulo == this.rotulo &&
          other.area == this.area &&
          other.subclassification == this.subclassification &&
          other.movementId == this.movementId);
}

class MedioBasicoCompanion extends UpdateCompanion<MedioBasicoTableEntity> {
  final Value<String> rotulo;
  final Value<String> area;
  final Value<String> subclassification;
  final Value<int?> movementId;
  final Value<int> rowid;
  const MedioBasicoCompanion({
    this.rotulo = const Value.absent(),
    this.area = const Value.absent(),
    this.subclassification = const Value.absent(),
    this.movementId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedioBasicoCompanion.insert({
    required String rotulo,
    required String area,
    required String subclassification,
    this.movementId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : rotulo = Value(rotulo),
        area = Value(area),
        subclassification = Value(subclassification);
  static Insertable<MedioBasicoTableEntity> custom({
    Expression<String>? rotulo,
    Expression<String>? area,
    Expression<String>? subclassification,
    Expression<int>? movementId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (rotulo != null) 'rotulo': rotulo,
      if (area != null) 'area': area,
      if (subclassification != null) 'subclassification': subclassification,
      if (movementId != null) 'movement_id': movementId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedioBasicoCompanion copyWith(
      {Value<String>? rotulo,
      Value<String>? area,
      Value<String>? subclassification,
      Value<int?>? movementId,
      Value<int>? rowid}) {
    return MedioBasicoCompanion(
      rotulo: rotulo ?? this.rotulo,
      area: area ?? this.area,
      subclassification: subclassification ?? this.subclassification,
      movementId: movementId ?? this.movementId,
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
    if (subclassification.present) {
      map['subclassification'] = Variable<String>(subclassification.value);
    }
    if (movementId.present) {
      map['movement_id'] = Variable<int>(movementId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedioBasicoCompanion(')
          ..write('rotulo: $rotulo, ')
          ..write('area: $area, ')
          ..write('subclassification: $subclassification, ')
          ..write('movementId: $movementId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MovementTable extends Movement
    with TableInfo<$MovementTable, MovementTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovementTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityMeta = const VerificationMeta('entity');
  @override
  late final GeneratedColumn<String> entity = GeneratedColumn<String>(
      'entity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _costCenterMeta =
      const VerificationMeta('costCenter');
  @override
  late final GeneratedColumn<String> costCenter = GeneratedColumn<String>(
      'cost_center', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
      'area', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, entity, costCenter, area, description, name, role, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'movement';
  @override
  VerificationContext validateIntegrity(
      Insertable<MovementTableEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity')) {
      context.handle(_entityMeta,
          entity.isAcceptableOrUnknown(data['entity']!, _entityMeta));
    } else if (isInserting) {
      context.missing(_entityMeta);
    }
    if (data.containsKey('cost_center')) {
      context.handle(
          _costCenterMeta,
          costCenter.isAcceptableOrUnknown(
              data['cost_center']!, _costCenterMeta));
    } else if (isInserting) {
      context.missing(_costCenterMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MovementTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovementTableEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      entity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity'])!,
      costCenter: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cost_center'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $MovementTable createAlias(String alias) {
    return $MovementTable(attachedDatabase, alias);
  }
}

class MovementTableEntity extends DataClass
    implements Insertable<MovementTableEntity> {
  final int? id;
  final String entity;
  final String costCenter;
  final String area;
  final String description;
  final String name;
  final String role;
  final String type;
  const MovementTableEntity(
      {this.id,
      required this.entity,
      required this.costCenter,
      required this.area,
      required this.description,
      required this.name,
      required this.role,
      required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['entity'] = Variable<String>(entity);
    map['cost_center'] = Variable<String>(costCenter);
    map['area'] = Variable<String>(area);
    map['description'] = Variable<String>(description);
    map['name'] = Variable<String>(name);
    map['role'] = Variable<String>(role);
    map['type'] = Variable<String>(type);
    return map;
  }

  MovementCompanion toCompanion(bool nullToAbsent) {
    return MovementCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      entity: Value(entity),
      costCenter: Value(costCenter),
      area: Value(area),
      description: Value(description),
      name: Value(name),
      role: Value(role),
      type: Value(type),
    );
  }

  factory MovementTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MovementTableEntity(
      id: serializer.fromJson<int?>(json['id']),
      entity: serializer.fromJson<String>(json['entity']),
      costCenter: serializer.fromJson<String>(json['costCenter']),
      area: serializer.fromJson<String>(json['area']),
      description: serializer.fromJson<String>(json['description']),
      name: serializer.fromJson<String>(json['name']),
      role: serializer.fromJson<String>(json['role']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'entity': serializer.toJson<String>(entity),
      'costCenter': serializer.toJson<String>(costCenter),
      'area': serializer.toJson<String>(area),
      'description': serializer.toJson<String>(description),
      'name': serializer.toJson<String>(name),
      'role': serializer.toJson<String>(role),
      'type': serializer.toJson<String>(type),
    };
  }

  MovementTableEntity copyWith(
          {Value<int?> id = const Value.absent(),
          String? entity,
          String? costCenter,
          String? area,
          String? description,
          String? name,
          String? role,
          String? type}) =>
      MovementTableEntity(
        id: id.present ? id.value : this.id,
        entity: entity ?? this.entity,
        costCenter: costCenter ?? this.costCenter,
        area: area ?? this.area,
        description: description ?? this.description,
        name: name ?? this.name,
        role: role ?? this.role,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('MovementTableEntity(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('costCenter: $costCenter, ')
          ..write('area: $area, ')
          ..write('description: $description, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, entity, costCenter, area, description, name, role, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovementTableEntity &&
          other.id == this.id &&
          other.entity == this.entity &&
          other.costCenter == this.costCenter &&
          other.area == this.area &&
          other.description == this.description &&
          other.name == this.name &&
          other.role == this.role &&
          other.type == this.type);
}

class MovementCompanion extends UpdateCompanion<MovementTableEntity> {
  final Value<int?> id;
  final Value<String> entity;
  final Value<String> costCenter;
  final Value<String> area;
  final Value<String> description;
  final Value<String> name;
  final Value<String> role;
  final Value<String> type;
  const MovementCompanion({
    this.id = const Value.absent(),
    this.entity = const Value.absent(),
    this.costCenter = const Value.absent(),
    this.area = const Value.absent(),
    this.description = const Value.absent(),
    this.name = const Value.absent(),
    this.role = const Value.absent(),
    this.type = const Value.absent(),
  });
  MovementCompanion.insert({
    this.id = const Value.absent(),
    required String entity,
    required String costCenter,
    required String area,
    required String description,
    required String name,
    required String role,
    required String type,
  })  : entity = Value(entity),
        costCenter = Value(costCenter),
        area = Value(area),
        description = Value(description),
        name = Value(name),
        role = Value(role),
        type = Value(type);
  static Insertable<MovementTableEntity> custom({
    Expression<int>? id,
    Expression<String>? entity,
    Expression<String>? costCenter,
    Expression<String>? area,
    Expression<String>? description,
    Expression<String>? name,
    Expression<String>? role,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entity != null) 'entity': entity,
      if (costCenter != null) 'cost_center': costCenter,
      if (area != null) 'area': area,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (role != null) 'role': role,
      if (type != null) 'type': type,
    });
  }

  MovementCompanion copyWith(
      {Value<int?>? id,
      Value<String>? entity,
      Value<String>? costCenter,
      Value<String>? area,
      Value<String>? description,
      Value<String>? name,
      Value<String>? role,
      Value<String>? type}) {
    return MovementCompanion(
      id: id ?? this.id,
      entity: entity ?? this.entity,
      costCenter: costCenter ?? this.costCenter,
      area: area ?? this.area,
      description: description ?? this.description,
      name: name ?? this.name,
      role: role ?? this.role,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entity.present) {
      map['entity'] = Variable<String>(entity.value);
    }
    if (costCenter.present) {
      map['cost_center'] = Variable<String>(costCenter.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovementCompanion(')
          ..write('id: $id, ')
          ..write('entity: $entity, ')
          ..write('costCenter: $costCenter, ')
          ..write('area: $area, ')
          ..write('description: $description, ')
          ..write('name: $name, ')
          ..write('role: $role, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $InventarioTable extends Inventario
    with TableInfo<$InventarioTable, InventarioTableEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventarioTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _classificationMeta =
      const VerificationMeta('classification');
  @override
  late final GeneratedColumn<String> classification = GeneratedColumn<String>(
      'classification', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCorrectPositionMeta =
      const VerificationMeta('isCorrectPosition');
  @override
  late final GeneratedColumn<bool> isCorrectPosition = GeneratedColumn<bool>(
      'is_correct_position', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_correct_position" IN (0, 1))'));
  static const VerificationMeta _correctPositionMeta =
      const VerificationMeta('correctPosition');
  @override
  late final GeneratedColumn<String> correctPosition = GeneratedColumn<String>(
      'correct_position', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [rotulo, area, classification, isCorrectPosition, correctPosition];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventario';
  @override
  VerificationContext validateIntegrity(
      Insertable<InventarioTableEntity> instance,
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
    if (data.containsKey('classification')) {
      context.handle(
          _classificationMeta,
          classification.isAcceptableOrUnknown(
              data['classification']!, _classificationMeta));
    } else if (isInserting) {
      context.missing(_classificationMeta);
    }
    if (data.containsKey('is_correct_position')) {
      context.handle(
          _isCorrectPositionMeta,
          isCorrectPosition.isAcceptableOrUnknown(
              data['is_correct_position']!, _isCorrectPositionMeta));
    }
    if (data.containsKey('correct_position')) {
      context.handle(
          _correctPositionMeta,
          correctPosition.isAcceptableOrUnknown(
              data['correct_position']!, _correctPositionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {rotulo};
  @override
  InventarioTableEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventarioTableEntity(
      rotulo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rotulo'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!,
      classification: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}classification'])!,
      isCorrectPosition: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_correct_position']),
      correctPosition: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}correct_position']),
    );
  }

  @override
  $InventarioTable createAlias(String alias) {
    return $InventarioTable(attachedDatabase, alias);
  }
}

class InventarioTableEntity extends DataClass
    implements Insertable<InventarioTableEntity> {
  final String rotulo;
  final String area;
  final String classification;
  final bool? isCorrectPosition;
  final String? correctPosition;
  const InventarioTableEntity(
      {required this.rotulo,
      required this.area,
      required this.classification,
      this.isCorrectPosition,
      this.correctPosition});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rotulo'] = Variable<String>(rotulo);
    map['area'] = Variable<String>(area);
    map['classification'] = Variable<String>(classification);
    if (!nullToAbsent || isCorrectPosition != null) {
      map['is_correct_position'] = Variable<bool>(isCorrectPosition);
    }
    if (!nullToAbsent || correctPosition != null) {
      map['correct_position'] = Variable<String>(correctPosition);
    }
    return map;
  }

  InventarioCompanion toCompanion(bool nullToAbsent) {
    return InventarioCompanion(
      rotulo: Value(rotulo),
      area: Value(area),
      classification: Value(classification),
      isCorrectPosition: isCorrectPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(isCorrectPosition),
      correctPosition: correctPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(correctPosition),
    );
  }

  factory InventarioTableEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventarioTableEntity(
      rotulo: serializer.fromJson<String>(json['rotulo']),
      area: serializer.fromJson<String>(json['area']),
      classification: serializer.fromJson<String>(json['classification']),
      isCorrectPosition: serializer.fromJson<bool?>(json['isCorrectPosition']),
      correctPosition: serializer.fromJson<String?>(json['correctPosition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rotulo': serializer.toJson<String>(rotulo),
      'area': serializer.toJson<String>(area),
      'classification': serializer.toJson<String>(classification),
      'isCorrectPosition': serializer.toJson<bool?>(isCorrectPosition),
      'correctPosition': serializer.toJson<String?>(correctPosition),
    };
  }

  InventarioTableEntity copyWith(
          {String? rotulo,
          String? area,
          String? classification,
          Value<bool?> isCorrectPosition = const Value.absent(),
          Value<String?> correctPosition = const Value.absent()}) =>
      InventarioTableEntity(
        rotulo: rotulo ?? this.rotulo,
        area: area ?? this.area,
        classification: classification ?? this.classification,
        isCorrectPosition: isCorrectPosition.present
            ? isCorrectPosition.value
            : this.isCorrectPosition,
        correctPosition: correctPosition.present
            ? correctPosition.value
            : this.correctPosition,
      );
  @override
  String toString() {
    return (StringBuffer('InventarioTableEntity(')
          ..write('rotulo: $rotulo, ')
          ..write('area: $area, ')
          ..write('classification: $classification, ')
          ..write('isCorrectPosition: $isCorrectPosition, ')
          ..write('correctPosition: $correctPosition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      rotulo, area, classification, isCorrectPosition, correctPosition);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventarioTableEntity &&
          other.rotulo == this.rotulo &&
          other.area == this.area &&
          other.classification == this.classification &&
          other.isCorrectPosition == this.isCorrectPosition &&
          other.correctPosition == this.correctPosition);
}

class InventarioCompanion extends UpdateCompanion<InventarioTableEntity> {
  final Value<String> rotulo;
  final Value<String> area;
  final Value<String> classification;
  final Value<bool?> isCorrectPosition;
  final Value<String?> correctPosition;
  final Value<int> rowid;
  const InventarioCompanion({
    this.rotulo = const Value.absent(),
    this.area = const Value.absent(),
    this.classification = const Value.absent(),
    this.isCorrectPosition = const Value.absent(),
    this.correctPosition = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventarioCompanion.insert({
    required String rotulo,
    required String area,
    required String classification,
    this.isCorrectPosition = const Value.absent(),
    this.correctPosition = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : rotulo = Value(rotulo),
        area = Value(area),
        classification = Value(classification);
  static Insertable<InventarioTableEntity> custom({
    Expression<String>? rotulo,
    Expression<String>? area,
    Expression<String>? classification,
    Expression<bool>? isCorrectPosition,
    Expression<String>? correctPosition,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (rotulo != null) 'rotulo': rotulo,
      if (area != null) 'area': area,
      if (classification != null) 'classification': classification,
      if (isCorrectPosition != null) 'is_correct_position': isCorrectPosition,
      if (correctPosition != null) 'correct_position': correctPosition,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventarioCompanion copyWith(
      {Value<String>? rotulo,
      Value<String>? area,
      Value<String>? classification,
      Value<bool?>? isCorrectPosition,
      Value<String?>? correctPosition,
      Value<int>? rowid}) {
    return InventarioCompanion(
      rotulo: rotulo ?? this.rotulo,
      area: area ?? this.area,
      classification: classification ?? this.classification,
      isCorrectPosition: isCorrectPosition ?? this.isCorrectPosition,
      correctPosition: correctPosition ?? this.correctPosition,
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
    if (classification.present) {
      map['classification'] = Variable<String>(classification.value);
    }
    if (isCorrectPosition.present) {
      map['is_correct_position'] = Variable<bool>(isCorrectPosition.value);
    }
    if (correctPosition.present) {
      map['correct_position'] = Variable<String>(correctPosition.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventarioCompanion(')
          ..write('rotulo: $rotulo, ')
          ..write('area: $area, ')
          ..write('classification: $classification, ')
          ..write('isCorrectPosition: $isCorrectPosition, ')
          ..write('correctPosition: $correctPosition, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MedioBasicoTable medioBasico = $MedioBasicoTable(this);
  late final $MovementTable movement = $MovementTable(this);
  late final $InventarioTable inventario = $InventarioTable(this);
  late final MedioBasicoDao medioBasicoDao =
      MedioBasicoDao(this as AppDatabase);
  late final MovementDao movementDao = MovementDao(this as AppDatabase);
  late final InvDao invDao = InvDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [medioBasico, movement, inventario];
}

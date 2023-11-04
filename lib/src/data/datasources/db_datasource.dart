import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:inventory_tesis/src/data/db/dao/medio_dao.dart';
import 'package:inventory_tesis/src/data/db/dao/movement_dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:inventory_tesis/src/domain/enums/type_movement.dart';
import 'package:inventory_tesis/src/domain/mapper/medio_mapper.dart';
import 'package:inventory_tesis/src/domain/mapper/movement_mapper.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';

abstract class DataBaseDataSources {
  Future<bool> importDataBase();

  Future<List<String?>> getAreas();

  Future<List<MedioEntity?>> getItemsByArea(
    String area,
  );

  Future<bool> insertMovement(
    MovementFormEntity movementFormEntity,
    List<MedioEntity> medio,
  );

  Future<List<MovementEntity>> getMovementByType(
    String type,
  );
}

class DataBaseDataSourcesImpl implements DataBaseDataSources {
  DataBaseDataSourcesImpl(
    this.medioDao,
    this.movementDao,
  );
  final MedioBasicoDao medioDao;
  final MovementDao movementDao;

  @override
  Future<bool> importDataBase() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls', 'csv'],
    );

    if (result != null) {
      await medioDao.deleteAllMBs();

      final file = File(result.files.single.path!);

      final String fileContent = await file.readAsString();

      final rows = const CsvToListConverter(shouldParseNumbers: false)
          .convert(fileContent.trim())
          .toSet();

      final medios = <MedioBasicoTableEntity>[];

      for (var row in rows) {
        final [
          String area,
          String rotulo,
          String subclassification,
        ] = row;

        final medio = MedioBasicoTableEntity(
          rotulo: rotulo,
          area: area,
          subclassification: subclassification,
        );
        medios.add(medio);
      }

      await medioDao.insertMBs(medios);

      return true;
    }
    return false;
  }

  @override
  Future<List<String?>> getAreas() async {
    return await medioDao.getAreas();
  }

  @override
  Future<List<MedioEntity?>> getItemsByArea(String area) async {
    final mediosList = await medioDao.getMBsByArea(area);
    final listFinal = <MedioEntity>[];

    for (var medio in mediosList) {
      final response = await medioDao.getCantMBsByAreaAndSubclassification(
          medio.area, medio.subclassification);

      final medioWithCant = MedioMapper.tableToEntity(medio, response);
      listFinal.add(medioWithCant);
    }

    final groupedBySubclassification = groupBy(listFinal, (MedioEntity e) {
      return e.subclassification;
    });

    final result = groupedBySubclassification.entries
        .map((entry) => entry.value.first)
        .toList();

    return result;
  }

  @override
  Future<bool> insertMovement(
      MovementFormEntity movementFormEntity, List<MedioEntity> medios) async {
    final movement = MovementMapper.modelToEntity(movementFormEntity, medios);

    final id = await movementDao.insertMovement(movement);
    log("Se inserto el movimiento");

    for (var element in medios) {
      final medio = MedioMapper.entityToTable(element, id);
      await medioDao.insertMB(medio);
      log("Se inserto un medio");
    }

    return true;
  }

  @override
  Future<List<MovementEntity>> getMovementByType(String type) async {
    List<MovementEntity> movementList = [];
    List<MedioEntity> medios = [];

    final response = await movementDao.getMovementsByType(type);

    for (var element in response) {
      TypeMovement typeMovement = TypeMovement.getByName(element.type);

      final mediosTable = await medioDao.getAllMBsByMovement(element.id!);

      for (var medio in mediosTable) {
        final newMedio = MedioMapper.tableToEntity(medio, 0);
        medios.add(newMedio);
      }

      final movementEntity = MovementMapper.entityToModel(
        medios,
        element,
        typeMovement,
      );

      movementList.add(movementEntity);
    }
    return movementList;
  }
}

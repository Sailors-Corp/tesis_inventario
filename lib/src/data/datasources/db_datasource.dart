import 'dart:io';

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:inventory_tesis/src/data/db/dao/medio_dao.dart';
import 'package:inventory_tesis/src/data/db/dao/movement_dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/mapper/medio_mapper.dart';
import 'package:inventory_tesis/src/data/mapper/movement_mapper.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';

abstract class DataBaseDataSources {
  Future<bool> importDataBase();

  Future<List<String?>> getAreas();
  Future<List<MedioEntity?>> getItemsByArea(String area);

  Future<void> updateItem(MedioEntity entity);
  Future<bool> insertMovement(MovementFormEntity movementFormEntity);
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

      final medioWithCant = MedioMapper.modelToEntity(medio, response);
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
  Future<void> updateItem(MedioEntity entity) async {
    final item = MedioMapper.formToModel(entity);
    await medioDao.updateMB(item);
  }

  @override
  Future<bool> insertMovement(MovementFormEntity movementFormEntity) async {
    final movement = MovementMapper.modelToEntity(movementFormEntity);
    await movementDao.insertMB(movement);
    return true;
  }
}

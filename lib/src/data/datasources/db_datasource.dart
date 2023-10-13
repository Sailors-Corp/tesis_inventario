import 'dart:io';

import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:inventory_tesis/src/data/db/dao/dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/mapper/medio_mapper.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';


abstract class DataBaseDataSources {
  Future<bool> importDataBase();

  Future<List<String?>> getAreas();
  Future<List<MedioEntity?>> getItemsByArea(String area);
}

class DataBaseDataSourcesImpl implements DataBaseDataSources {
  final MBDao medioDao;

  DataBaseDataSourcesImpl(this.medioDao);

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

      final medios = <MedioBasicoEntity>[];

      for (var row in rows) {
        final [
          String area,
          String rotulo,
          String subclassification,
        ] = row;

        final medio = MedioBasicoEntity(
          rotulo: rotulo,
          area: area,
          subclasification: subclassification,
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
          medio.area, medio.subclasification);

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

}

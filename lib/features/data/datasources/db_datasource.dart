import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:inventory_tesis/features/data/db/dao/dao.dart';
import 'package:inventory_tesis/features/data/db/database.dart';

abstract class DBDataSources {
  Future<void> getCSVDataBase();
}

class DBDataSourcesImpl implements DBDataSources {
  final MedioDao medioDao;

  DBDataSourcesImpl(this.medioDao);

  @override
  Future<void> getCSVDataBase() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls', 'csv'],
    );

    if (result != null) {
      final file = File(result.files.single.path!);

      final String fileContent = await file.readAsString();

      final rows = const CsvToListConverter(shouldParseNumbers: false)
          .convert(fileContent.trim())
          .toSet();

      final medios = <MedioTableEntity>[];

      for (var row in rows) {
        final [
          String area,
          String rotulo,
          String subclassification,
        ] = row;

        final medio = MedioTableEntity(
          rotulo: rotulo,
          area: area,
          subclasification: subclassification,
        );
        medios.add(medio);
      }

      await medioDao.insertMedios(medios);
    }
  }
}

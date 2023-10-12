import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:inventory_tesis/src/data/db/dao/dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';

abstract class DBDataSources {
  Future<void> getCSVDataBase();
}

class DBDataSourcesImpl implements DBDataSources {
  final MBDao medioDao;

  DBDataSourcesImpl(this.medioDao);

  @override
  Future<void> getCSVDataBase() async {
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

      final medios = <MBTableEntity>[];

      for (var row in rows) {
        final [
          String area,
          String rotulo,
          String subclassification,
        ] = row;

        final medio = MBTableEntity(
          rotulo: rotulo,
          area: area,
          subclasification: subclassification,
        );
        medios.add(medio);
      }

      await medioDao.insertMBs(medios);
    }
  }
}

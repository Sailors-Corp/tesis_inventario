import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';

abstract class DataBaseRepository {
  Future<Result<List<String?>>> getAllData();

  Future<Result<List<MedioEntity?>>> getItemsByArea(String mediosList);

  Future<Result<bool>> importDataBase();
}

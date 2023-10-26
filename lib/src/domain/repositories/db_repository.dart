import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';

abstract class DataBaseRepository {
  Future<Result<List<String?>>> getAllData();

  Future<Result<List<MedioEntity?>>> getItemsByArea(String mediosList);

  Future<Result<bool>> importDataBase();


  Future<Result<bool>> insertMovement(MovementFormEntity movementFormEntity);


}

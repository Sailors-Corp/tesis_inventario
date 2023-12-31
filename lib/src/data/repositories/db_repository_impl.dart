import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/data/datasources/db_datasource.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:inventory_tesis/src/domain/repositories/db_repository.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';

class DataBaseRepositoryImpl extends DataBaseRepository {
  DataBaseRepositoryImpl(this._dataBaseDataSources);

  final DataBaseDataSources _dataBaseDataSources;

  @override
  Future<Result<List<String?>>> getAllData() {
    try {
      final response = _dataBaseDataSources.getAreas();
      return response.then((value) => Success(data: value));
    } catch (e) {
      return Future.value(Failure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<MedioEntity?>>> getItemsByArea(String mediosList) {
    try {
      final response = _dataBaseDataSources.getItemsByArea(mediosList);
      return response.then((value) => Success(data: value));
    } catch (e) {
      return Future.value(Failure(message: e.toString()));
    }
  }

  @override
  Future<Result<bool>> importDataBase() async {
    try {
      final response = await _dataBaseDataSources.importDataBase();
      return Success(data: response);
    } catch (e) {
      return Future.value(Failure(message: e.toString()));
    }
  }

  @override
  Future<Result<bool>> insertMovement(
      MovementFormEntity movementFormEntity, List<MedioEntity> medios) {
    try {
      final response =
          _dataBaseDataSources.insertMovement(movementFormEntity, medios);
      return response.then((value) => Success(data: value));
    } catch (e) {
      return Future.value(Failure(message: e.toString()));
    }
  }


  @override
  Future<Result<List<MovementEntity>>> getMovementByType(String type) async {
    try {
      final response = await _dataBaseDataSources.getMovementByType(type);
      return Success(data: response);
    } catch (e) {
      return Failure(message: e.toString());
    }
  }
}

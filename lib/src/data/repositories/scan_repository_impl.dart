import 'dart:developer';

import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/data/datasources/db_datasource.dart';
import 'package:inventory_tesis/src/data/db/dao/inventario_dao.dart';
import 'package:inventory_tesis/src/data/db/dao/medio_dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/entities/inventory_entity.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';

class ScanRepositoryImpl extends ScanRepository {
  final MedioBasicoDao mbDao;
  final InvDao invDao;

  final DataBaseDataSources dataBaseDataSources;

  ScanRepositoryImpl(
    this.mbDao,
    this.invDao,
    this.dataBaseDataSources,
  );

  @override
  Future<String> scan(String rotulo, String area) async {
    final MedioBasicoTableEntity? response = await mbDao.getMBsByRotulo(rotulo);

    if (response == null) {
      return '';
    }
    if (response.area == area) {
      return response.area;
    }
    return '';
  }

  @override
  Future<String> takeInventory(
    String rotulo,
    String area,
    String invArea,
  ) async {
    final MedioBasicoTableEntity? response = await mbDao.getMBsByRotulo(rotulo);

    if (response == null) {
      return '';
    }

    log("InvArea: => $invArea\n Area: => $area\n ResponseArea: => ${response.area}");

    if (invArea == 'Todas') {
      if (response.area == area) {
        InventarioTableEntity medioInv = InventarioTableEntity(
          rotulo: response.rotulo,
          area: response.area,
          classification: response.subclassification,
        );
        await invDao.insertInv(medioInv);
        log('Se inserto en todas');
        return area;
      }
    } else {
      if (response.area == area && response.area == invArea) {
        InventarioTableEntity medioInv = InventarioTableEntity(
          rotulo: response.rotulo,
          area: response.area,
          classification: response.subclassification,
          isCorrectPosition: true,
        );
        await invDao.insertInv(medioInv);
        log('Se inserto con posición correcta');
        return area;
      } else {
        InventarioTableEntity medioInv = InventarioTableEntity(
          rotulo: response.rotulo,
          area: invArea,
          classification: response.subclassification,
          isCorrectPosition: false,
          correctPosition: response.area,
        );

        log(medioInv.toString());
        await invDao.insertInv(medioInv);
        log('Se inserto con posición incorrecta');
        return response.area;
      }
    }
    return '';
  }

  @override
  Future<double> percentInventory(String area) async {
    List<MedioBasicoTableEntity> listMedios = [];
    List<InventarioTableEntity> listInv = [];
    if (area != 'Todas') {
      listMedios = await mbDao.getMBsByArea(area);
      listInv = await invDao.getInventoryByArea(area);
    } else {
      listMedios = await mbDao.getAllMBs();
      listInv = await invDao.getAllInventory();
    }
    final double percent = listInv.length / listMedios.length * 100;

    log("${listInv.length} - ${listMedios.length}");

    if (listInv.isNotEmpty) {
      return percent;
    } else {
      return 0.0;
    }
  }

  @override
  Future<Result<InventoryEntity>> getMediosInventoried() async {
    try {
      final response = await dataBaseDataSources.getMediosInventoried();
      return Success(data: response);
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  @override
  Future<void> closeInventory() async {
    await dataBaseDataSources.closeInventory();
  }
}

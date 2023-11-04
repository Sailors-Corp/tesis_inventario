import 'dart:developer';

import 'package:inventory_tesis/src/data/db/dao/inventario_dao.dart';
import 'package:inventory_tesis/src/data/db/dao/medio_dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';

class ScanRepositoryImpl extends ScanRepository {
  final MedioBasicoDao mbDao;
  final InvDao invDao;

  ScanRepositoryImpl(this.mbDao, this.invDao);

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
      String rotulo, String area, String invArea) async {
    final MedioBasicoTableEntity? response = await mbDao.getMBsByRotulo(rotulo);

    if (response == null) {
      return '';
    }
    log("InvArea: => ${invArea}\n Area: => ${area}\n ResponseArea: => ${response.area}");
    if (invArea == 'Todas') {
      if (response.area == area) {
        InventarioEntity medioInv = InventarioEntity(
            rotulo: response.rotulo,
            area: response.area,
            subclasification: response.subclassification);
        await invDao.insertInv(medioInv);
        log('Se inserto');
        return area;
      }
    } else {
      if (response.area == area && response.area == invArea) {
        InventarioEntity medioInv = InventarioEntity(
            rotulo: response.rotulo,
            area: response.area,
            subclasification: response.subclassification);
        await invDao.insertInv(medioInv);
        log('Se inserto');
        return area;
      } else {
        return response.area;
      }
    }
    return '';
  }

  @override
  Future<double> percentInventory(String area) async {
    List<MedioBasicoTableEntity> listMedios = [];
    List<InventarioEntity> listInv = [];
    if (area != 'Todas') {
      listMedios = await mbDao.getMBsByArea(area);
      listInv = await invDao.getInvsByArea(area);
    } else {
      listMedios = await mbDao.getAllMBs();
      listInv = await invDao.getAllInvs();
    }
    final double percent = listMedios.length / listInv.length / 100;
    log("${listInv.length} - ${listMedios.length}");
    if (listInv.isNotEmpty) {
      return percent;
    } else {
      return 0.0;
    }
  }
}

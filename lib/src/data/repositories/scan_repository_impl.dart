import 'dart:ffi';

import 'package:inventory_tesis/src/data/db/dao/dao.dart';
import 'package:inventory_tesis/src/data/db/dao/inventario_dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';

class ScanRepositoryImpl extends ScanRepository {
  final MBDao mbDao;
  final InvDao invDao;

  ScanRepositoryImpl(this.mbDao, this.invDao);

  @override
  Future<bool> scan(String rotulo, String area) async {
    final MedioBasicoEntity? response = await mbDao.getMBsByRotulo(rotulo);

    if (response == null) {
      return false;
    }
    if (response.area == area) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> takeInventory(String rotulo, String area, String invArea) async {
    final MedioBasicoEntity? response = await mbDao.getMBsByRotulo(rotulo);

    if (response == null) {
      return false;
    }
    if (invArea == 'Todas') {
      if (response.area == area) {
        InventarioEntity medioInv = InventarioEntity(
            rotulo: response.rotulo,
            area: response.area,
            subclasification: response.subclasification);
        await invDao.insertInv(medioInv);
        return true;
      }
    } else {
      if (response.area == area) {
        InventarioEntity medioInv = InventarioEntity(
            rotulo: response.rotulo,
            area: response.area,
            subclasification: response.subclasification);
        await invDao.insertInv(medioInv);
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  @override
  Future<double> percentInventory(String area) async {
    List<MedioBasicoEntity> listMedios = [];
    List<InventarioEntity> listInv = [];
    if (area != 'Todas') {
      listMedios = await mbDao.getMBsByArea(area);
      listInv = await invDao.getInvsByArea(area);
    } else {
      listMedios = await mbDao.getMBsByArea(area);
      listInv = await invDao.getInvsByArea(area);
    }

    final double percent = listMedios.length / listInv.length * 100;

    return percent;
  }
}

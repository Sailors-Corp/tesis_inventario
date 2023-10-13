import 'package:inventory_tesis/src/data/db/dao/dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';

class ScanRepositoryImpl extends ScanRepository {
  final MBDao mbDao;

  ScanRepositoryImpl(this.mbDao);

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
}

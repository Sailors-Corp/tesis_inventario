import 'package:inventory_tesis/src/data/db/dao/medio_dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';

class ScanRepositoryImpl extends ScanRepository {
  final MedioBasicoDao mbDao;

  ScanRepositoryImpl(this.mbDao);

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
}

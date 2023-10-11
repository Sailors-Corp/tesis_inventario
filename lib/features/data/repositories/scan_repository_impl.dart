import 'package:inventory_tesis/features/data/db/dao/dao.dart';
import 'package:inventory_tesis/features/data/db/database.dart';
import 'package:inventory_tesis/features/domain/repositories/scan_repositoy.dart';

class ScanRepositoryImpl extends ScanRepository {
  final MBDao mbDao;

  ScanRepositoryImpl(this.mbDao);

  @override
  Future<bool> scan(String rotulo, String area) async {
    
    final MBTableEntity? response = await mbDao.getMBsByRotulo(rotulo);

    if (response == null) {
      return false;
    }
    if (response.area == area) {
      return true;
    }
    return false;
  }
}

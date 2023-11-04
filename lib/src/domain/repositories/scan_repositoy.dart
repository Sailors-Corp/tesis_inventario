import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/inventory_entity.dart';

abstract class ScanRepository {
  Future<String> scan(String rotulo, String area);
  Future<String> takeInventory(String rotulo, String area, String invArea);
  Future<double> percentInventory(String area);
  Future<void> closeInventory();
  Future<Result<InventoryEntity>> getMediosInventoried();
}

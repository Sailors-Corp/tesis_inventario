import 'dart:ffi';

abstract class ScanRepository {
  Future<bool> scan(String rotulo, String area);
  Future<bool> takeInventory(String rotulo, String area, String invArea);
  Future<double> percentInventory(String area);
}

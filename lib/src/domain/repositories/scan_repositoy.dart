

abstract class ScanRepository {
  Future<String> scan(String rotulo, String area);
  Future<bool> takeInventory(String rotulo, String area, String invArea);
  Future<double> percentInventory(String area);
}

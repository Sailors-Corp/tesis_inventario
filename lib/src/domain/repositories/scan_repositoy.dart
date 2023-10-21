

abstract class ScanRepository {
  Future<String> scan(String rotulo, String area);
  Future<String> takeInventory(String rotulo, String area, String invArea);
  Future<double> percentInventory(String area);
}

import 'package:qr_flutter/qr_flutter.dart';

abstract class GenerateQRRepository {
  Future<QrImageView?> generateQR(
      String rotulo, String subClasificacion, String area);
}

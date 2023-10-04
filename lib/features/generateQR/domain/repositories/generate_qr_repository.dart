import 'package:qr_flutter/qr_flutter.dart';

abstract class GenerateQRRepository {
  Future<QrImageView?> generateQR(
    String nombre,
    String subClasificacion,
    String rotulo,
  );
}

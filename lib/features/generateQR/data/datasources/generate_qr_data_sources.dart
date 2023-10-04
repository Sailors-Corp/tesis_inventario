import 'package:qr_flutter/qr_flutter.dart';

abstract class GenerateQRDataSources {
  QrImageView GenerateQR(String nombre, String subClasificacion, String rotulo);
}

class GenerateQRDataSourcesImpl extends GenerateQRDataSources {
  @override
  QrImageView GenerateQR(
      String nombre, String subClasificacion, String rotulo) {
    return QrImageView(
      data:
          'Nombre: $nombre, Subclasificación: $subClasificacion, Rotulo: $rotulo',
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
  }
}

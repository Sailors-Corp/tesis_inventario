import 'package:inventory_tesis/features/data/datasources/generate_qr_data_sources.dart';
import 'package:inventory_tesis/features/domain/repositories/generate_qr_repository.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRRepositoryImpl extends GenerateQRRepository {
  GenerateQRRepositoryImpl(this._generateQRDataSources);

  final GenerateQRDataSources _generateQRDataSources;

  @override
  Future<QrImageView?> generateQR(
      String nombre, String subClasificacion, String rotulo) async {
    return _generateQRDataSources.GenerateQR(
      nombre,
      subClasificacion,
      rotulo,
    );
  }
}

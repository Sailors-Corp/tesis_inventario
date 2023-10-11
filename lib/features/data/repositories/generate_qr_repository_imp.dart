import 'dart:convert';

import 'package:inventory_tesis/features/domain/repositories/generate_qr_repository.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRRepositoryImpl extends GenerateQRRepository {
  GenerateQRRepositoryImpl();

  @override
  Future<QrImageView?> generateQR(
    String area,
    String subClassification,
    String rotulo,
  ) async {
    Map<String, dynamic> dataString = {
      'rotulo': rotulo,
      'subClassification': subClassification,
      'area': area,
    };

    String jsonString = jsonEncode(dataString);

    return QrImageView(
      data: jsonString,
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
  }
}

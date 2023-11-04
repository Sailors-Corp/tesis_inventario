import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:inventory_tesis/src/domain/repositories/generate_qr_repository.dart';
import 'package:inventory_tesis/src/presentation/forms/medio_form.dart';
import 'package:inventory_tesis/src/presentation/generated/assets/assets.gen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRRepositoryImpl extends GenerateQRRepository {
  GenerateQRRepositoryImpl();

  @override
  Future<QrImageView?> generateQR(
    MedioFormEntity medioFormEntity,
  ) async {
    Map<String, dynamic> dataString = {
      'rotulo': medioFormEntity.rotulo,
      'subClassification': medioFormEntity.subclassification,
      'area': medioFormEntity.area,
    };

    String jsonString = jsonEncode(dataString);

    return QrImageView(
      embeddedImage: AssetImage(Assets.img.uciLogo.path),
      embeddedImageStyle: const QrEmbeddedImageStyle(
        size: Size(80, 80),
      ),
      data: jsonString,
      version: QrVersions.auto,
      size: 320,
      gapless: false,
    );
  }
}

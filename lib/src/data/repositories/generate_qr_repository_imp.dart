// ignore_for_file: avoid_renaming_method_parameters

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory_tesis/src/domain/repositories/generate_qr_repository.dart';
import 'package:inventory_tesis/src/presentation/generated/assets/assets.gen.dart';
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
      backgroundColor: Colors.white,
      data: jsonString,
      version: QrVersions.auto,
      size: 320,
    );
  }
}

import 'package:inventory_tesis/src/presentation/forms/medio_form.dart';
import 'package:qr_flutter/qr_flutter.dart';

abstract class GenerateQRRepository {
  Future<QrImageView?> generateQR(
    MedioFormEntity medioFormEntity,
  );
}

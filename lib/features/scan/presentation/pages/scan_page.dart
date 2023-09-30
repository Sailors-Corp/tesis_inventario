import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inventory_tesis/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/common/theme/app_colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  createState() => _ScanPage();
}

class _ScanPage extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Escanear medio'),
      ),
      body: const Scan(),
    );
  }
}

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;

  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  bool isDialogOpen = false;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      if (!isDialogOpen) {
        isDialogOpen = true;
        _showMyDialog(context: context, result: result!).then((_) {
          isDialogOpen = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: QRView(
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
            ),
            cameraFacing: CameraFacing.back,
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                height: 30,
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    context.router.pop();
                  },
                  child: const Text('Cancelar'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showMyDialog(
      {required BuildContext context, required Barcode result}) async {
    final TextEditingController rotuloController =
        TextEditingController(text: result.code.toString());
    final TextEditingController subclasificationController =
        TextEditingController(text: result.format.toString());
    final TextEditingController areaController =
        TextEditingController(text: result.format.toString());

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text("Resultado"),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Verificar si el medio esta en el lugar que le corresponde
                const Text(
                  'Este medio básico fuera del area de correspondencia',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Rotulo',
                  ),
                  controller: rotuloController,
                ),
                TextField(
                  readOnly: true,
                  controller: subclasificationController,
                  decoration: const InputDecoration(
                    labelText: 'Subclasificación',
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: areaController,
                  decoration: const InputDecoration(
                    labelText: 'Área',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Escanear otro'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const Spacer(),
            TextButton(
              child: const Text('Ver detalles'),
              onPressed: () {
                context.router.push(const ScaDetailsRoute());
              },
            ),
          ],
        );
      },
    );
  }
}

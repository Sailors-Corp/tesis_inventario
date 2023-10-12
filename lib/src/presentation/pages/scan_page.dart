import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/common/theme/app_colors.dart';
import 'package:inventory_tesis/core/utils/class_utility.dart';
import 'package:inventory_tesis/injector.dart';
import 'package:inventory_tesis/src/data/models/item_model.dart';
import 'package:inventory_tesis/src/presentation/blocs/scan/scan_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector.call<ScanCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Escanear medio'),
        ),
        body: const Scan(),
      ),
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

  QRViewController? controller;
  late String result = '';

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
        result = scanData.code!;
      });

      result = await Utilities.eliminarComillas(result);

      final item = itemModelFromJson(result);

      await context.read<ScanCubit>().scan(item.rotulo, item.area);

      if (!isDialogOpen) {
        isDialogOpen = true;
        _showMyDialog(
                context: context,
                item: item,
                isCorrect: context.read<ScanCubit>().state.isCorrectPositon)
            .then((_) {
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
      {required BuildContext context,
      required ItemModel item,
      required bool isCorrect}) async {
    final TextEditingController rotuloController =
        TextEditingController(text: item.rotulo);
    final TextEditingController subclasificationController =
        TextEditingController(text: item.subClassification);
    final TextEditingController areaController =
        TextEditingController(text: item.area);

    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text("Resultado"),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                isCorrect == true
                    ? Container()
                    : const Text(
                        'El medio basico no esta en su lugar',
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
          ],
        );
      },
    );
  }
}

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';
import 'package:inventory_tesis/src/core/utils/delete_cotes.dart';
import 'package:inventory_tesis/src/data/models/medio_basico_model.dart';
import 'package:inventory_tesis/src/dependencies.dart';
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
  bool isDialogOpen = false;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null && Platform.isAndroid) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      try {
        setState(() {
          result = scanData.code!;
        });
        result = await Utilities.deleteCotesInText(result);
        final item = itemModelFromJson(result);
        // ignore: use_build_context_synchronously
        await context.read<ScanCubit>().scan(item.rotulo, item.area);
        if (!isDialogOpen) {
          isDialogOpen = true;
          // ignore: use_build_context_synchronously
          _showMyDialog(
            context: context,
            item: item,
            correctPosition: context.read<ScanCubit>().state.correctPosition!,
          ).then((_) {
            isDialogOpen = false;
          });
        }
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ScanCubit>();

    return BlocListener<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is ScanClosed) {
          controller?.resumeCamera();
        }
      },
      child: Column(
        children: [
          Expanded(
            flex: 4,
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
                      if (cubit.state is! ScanClosed) {
                        cubit.emit(ScanClosed());
                      }
                      context.router.pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



Future<void> _showMyDialog({
  required BuildContext context,
  required MedioBasicoModel item,
  required String correctPosition,
}) async {
  final TextEditingController rotuloController =
      TextEditingController(text: item.rotulo);
  final TextEditingController subclassificationController =
      TextEditingController(text: item.subClassification);
  final TextEditingController areaController =
      TextEditingController(text: item.area);

  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(12),
                color: correctPosition == item.area ? Colors.green : Colors.red,
                child: Center(
                  child: Text(
                    correctPosition.isEmpty
                        ? 'El medio no se encuentra en la base de datos'
                        : correctPosition == item.area
                            ? 'El medio básico está en su lugar'
                            : 'El medio básico no está en su lugar, pertenece a $correctPosition',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Rótulo',
                  ),
                  controller: rotuloController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  readOnly: true,
                  controller: subclassificationController,
                  decoration: const InputDecoration(
                    labelText: 'Subclasificación',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  readOnly: true,
                  controller: areaController,
                  decoration: const InputDecoration(
                    labelText: 'Área',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cerrar',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

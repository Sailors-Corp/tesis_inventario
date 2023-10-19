import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/dependencies.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/delete_cotes.dart';
import 'package:inventory_tesis/src/data/models/item_model.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/scan/scan_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@RoutePage()
class TakeInventoryPage extends StatefulWidget {
  const TakeInventoryPage({super.key});

  @override
  createState() => _TakeInventoryPage();
}

class _TakeInventoryPage extends State<TakeInventoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector.call<ScanCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Inventario'),
        ),
        body: const ScanInventory(),
      ),
    );
  }
}

class ScanInventory extends StatefulWidget {
  const ScanInventory({super.key});

  @override
  State<ScanInventory> createState() => _ScanInventoryState();
}

class _ScanInventoryState extends State<ScanInventory> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  late String result = '';
  List<String> areas = [];
  String areaSelect = "Todas";

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

      result = await Utilities.deleteCotesInText(result);

      final item = itemModelFromJson(result);

      // ignore: use_build_context_synchronously
      await context
          .read<ScanCubit>()
          .takeInventory(item.rotulo, item.area, areaSelect);

      if (!isDialogOpen) {
        isDialogOpen = true;
        // ignore: use_build_context_synchronously
        _showMyDialog(
                context: context,
                item: item,
                // ignore: use_build_context_synchronously
                correctPosition:
                    context.read<ScanCubit>().state.correctPosition ?? '')
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
    final areaBloc = BlocProvider.of<AreaBloc>(context)
      ..add(const AreasLoaded());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<AreaBloc, BaseState<List<String?>>>(
            builder: (context, state) => state.when(
              initial: Container.new,
              loading: () => const CupertinoActivityIndicator(),
              error: (error) {
                return Center(
                  child: Text(error),
                );
              },
              empty: () => DropdownButtonFormField(
                items: [].map((e) {
                  /// Ahora creamos "e" y contiene cada uno de los items de la lista.
                  return const DropdownMenuItem(
                    enabled: false,
                    value: "Todas",
                    child: Text("Todas"),
                  );
                }).toList(),
                onChanged: (String? value) {},
              ),
              success: (data) => DropdownButtonFormField(
                hint: const Text("Seleccione el área deseada..."),
                items: data.map((e) {
                  /// Ahora creamos "e" y contiene cada uno de los items de la lista.
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e!),
                  );
                }).toList(),
                onChanged: (value) {
                  areaSelect = value!;
                },
              ),
            ),
          ),
        ),
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
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(
                        'Grafica',
                      ),
                    ),
                    Text('%'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
          ]),
        ),
      ],
    );
  }

  Future<void> _showMyDialog({
    required BuildContext context,
    required ItemModel item,
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
                  color:
                      correctPosition == item.area ? Colors.green : Colors.red,
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
}

// ignore_for_file: use_build_context_synchronously, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/delete_cotes.dart';
import 'package:inventory_tesis/src/data/models/medio_basico_model.dart';
import 'package:inventory_tesis/src/dependencies.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/medios_inventoried/medios_inventoried_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector.call<ScanCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Realizar inventario'),
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
    if (controller != null && Platform.isAndroid) {
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

      await context
          .read<ScanCubit>()
          .takeInventory(item.rotulo, item.area, areaSelect);
      if (!isDialogOpen) {
        isDialogOpen = true;
        _showMyDialog(
                context: context,
                item: item,
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
    context.read<AreaBloc>().add(const AreasLoaded());
    final cubit = context.read<ScanCubit>();

    cubit.getPercent(areaSelect);

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
              empty: () => const Text('Importe una base de datos'),
              success: (data) => DropdownButtonFormField(
                hint: const Text("Seleccione el área deseada..."),
                items: data.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e!),
                  );
                }).toList(),
                onChanged: (value) {
                  areaSelect = value!;
                  cubit.getPercent(areaSelect);
                  setState(() {});
                },
              ),
            ),
          ),
        ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ScanCubit, ScanState>(
            builder: (context, state) {
              if (state is ScanSuccessPercent) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 4,
                      child: GFProgressBar(
                        percentage: state.percent ?? 0.0,
                        lineHeight: 30,
                        backgroundColor: Colors.black26,
                        progressBarColor: state.percent == null
                            ? Colors.red
                            : state.percent != null && state.percent! < 0.01
                                ? Colors.red
                                : state.percent! < 0.5
                                    ? Colors.yellow.withOpacity(.7)
                                    : Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 5, top: 5, bottom: 5),
                          child: Text(
                            "${state.percent! * 100}%",
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(flex: 1, child: Text(areaSelect))
                  ],
                );
              }
              return Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: GFProgressBar(
                      percentage: state.percent ?? 0.0,
                      lineHeight: 30,
                      backgroundColor: Colors.black26,
                      progressBarColor: state.percent == null
                          ? Colors.red
                          : state.percent != null && state.percent! < 0.01
                              ? Colors.red
                              : state.percent! < 0.5
                                  ? Colors.yellow.withOpacity(.7)
                                  : Colors.green,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                        child: Text(
                          "${state.percent! * 100}%",
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      areaSelect,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        BlocBuilder<ScanCubit, ScanState>(
          builder: (context, state) {
            return state.percent != 0
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: SizedBox(
                        height: 30,
                        width: 120,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          onPressed: () async {
                            controller!.pauseCamera();
                            context
                                .read<MediosInventoriedBloc>()
                                .add(MediosInventoriedLoaded());
                            context.router.push(const InventoryReportRoute());
                          },
                          child: const Text('Terminar'),
                        ),
                      ),
                    ),
                  )
                : Padding(
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
                            if (cubit.state is! ScanClosed) {
                              cubit.emit(ScanClosed());
                            }
                            context.router.pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ],
    );
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
        controller!.pauseCamera();
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  color: correctPosition.isEmpty
                      ? Colors.red
                      : correctPosition != 'Todas'
                          ? correctPosition == areaSelect
                              ? Colors.green
                              : Colors.red
                          : correctPosition == item.area
                              ? Colors.green
                              : Colors.red,
                  child: Center(
                    child: Text(
                      correctPosition.isEmpty
                          ? 'El medio no se encuentra en la base de datos'
                          : areaSelect != 'Todas'
                              ? correctPosition == areaSelect
                                  ? 'El medio básico está en su lugar'
                                  : 'El medio básico no está en su lugar, pertenece a $correctPosition'
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
                    controller!.resumeCamera();
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

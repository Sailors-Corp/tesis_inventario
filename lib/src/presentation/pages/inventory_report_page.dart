import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/domain/entities/inventory_entity.dart';
import 'package:inventory_tesis/src/presentation/blocs/medios_inventoried/medios_inventoried_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class InventoryReportPage extends StatelessWidget {
  const InventoryReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de inventario'),
        centerTitle: false,
        actions: [
          BlocBuilder<MediosInventoriedBloc, BaseState<InventoryEntity>>(
              builder: (context, state) {
            return state is BaseStateSuccess
                ? IconButton(
                    onPressed: () {
                      final data =
                          (state as BaseStateSuccess<InventoryEntity>).data;
                      _exportPDF(data);
                    },
                    icon: const Icon(CupertinoIcons.cloud_download),
                  )
                : Container();
          }),
          IconButton(
              onPressed: () async {
                context
                    .read<MediosInventoriedBloc>()
                    .add(MediosInventoriedClosed());

                context.router.replace(const HomeRoute());
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: const ViewMediosInventoried(),
    );
  }
}

class ViewMediosInventoried extends StatelessWidget {
  const ViewMediosInventoried({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediosInventoriedBloc, BaseState<InventoryEntity>>(
      builder: (context, state) => state.when(
        initial: Container.new,
        loading: () => const CupertinoActivityIndicator(),
        error: (error) => Container(),
        empty: Container.new,
        success: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Medios en su lugar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child: ListView.builder(
                itemCount: data.correctMedios.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(data.correctMedios[index].classification),
                    subtitle: Text(data.correctMedios[index].rotulo),
                    trailing: Text(data.correctMedios[index].area),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Medios en lugar incorrecto',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child: ListView.builder(
                itemCount: data.incorrectMedios.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(data.incorrectMedios[index].classification),
                    subtitle: Text(data.incorrectMedios[index].rotulo),
                    trailing: Column(
                      children: [
                        Text(data.incorrectMedios[index].area),
                        Text(
                            'Pertenece a: ${data.incorrectMedios[index].correctPosition}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _exportPDF(
  InventoryEntity data,
) async {
  try {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    } else {
      final pdfFile = await generatePDF(data);

      await OpenFile.open(pdfFile.path);
    }
  } catch (error) {
    log(error.toString());
  }
}

Future<File> generatePDF(InventoryEntity data) async {
  final pdf = pw.Document();

  String getFormattedDate(DateTime dateTime) {
    final dayOfWeek = DateFormat.EEEE('es').format(dateTime);
    final day = DateFormat.d().format(dateTime);
    final month = DateFormat.MMMM('es').format(dateTime);
    final year = DateFormat.y().format(dateTime);
    final time = DateFormat.jm().format(dateTime);

    return '$dayOfWeek, $day de $month de $year a las $time';
  }

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.ListView(children: [
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text('Reporte de Inventario'),
          ),
          pw.SizedBox(height: 5),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text('Fecha: ${getFormattedDate(DateTime.now())}'),
          ),
          pw.SizedBox(height: 15),
          pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text('Medios básicos fuera de lugar'),
          ),
          pw.SizedBox(height: 10),
          ...data.incorrectMedios
              .map(
                (e) => pw.Container(
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Column(
                          children: [
                            pw.Text(e.classification),
                            pw.Text(e.rotulo),
                          ],
                        ),
                        pw.SizedBox(width: 200),
                        pw.Column(
                          children: [
                            pw.Text(e.area),
                            pw.Text('Pertenece a: ${e.correctPosition!}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ]);
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File('${output.path}/Reporte de movimiento.pdf');
  await file.writeAsBytes(await pdf.save());

  return file;
}

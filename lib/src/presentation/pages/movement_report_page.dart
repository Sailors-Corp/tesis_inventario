import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:inventory_tesis/src/domain/enums/type_movement.dart';
import 'package:inventory_tesis/src/presentation/movement/movement_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class MovementReportPage extends StatelessWidget {
  const MovementReportPage({super.key, required this.typeReport});

  final String typeReport;

  Future<void> exportPDF(List<MovementEntity> data, String typeReport) async {
    try {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        await Permission.storage.request();
      } else {
        final pdfFile = await generatePDF(data, typeReport);

        await OpenFile.open(pdfFile.path);
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<File> generatePDF(List<MovementEntity> data, String typeReport) async {
    final pdf = pw.Document();

    for (var element in data) {
      pdf.addPage(
        pw.Page(
          build: (context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Align(
                    alignment: pw.Alignment.centerLeft,
                    child: pw.Container(
                        child: pw.Text('Reporte de movimiento $typeReport')),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Row(
                    children: [
                      pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                          ),
                          height: 40,
                          width: 400,
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Entidad:${element.entity}'),
                          )),
                      pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                          ),
                          height: 40,
                          width: 100,
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Numero:${element.role}'),
                          )),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                          ),
                          height: 40,
                          width: 500,
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                                'Centro de costo:${element.costCenter}'),
                          )),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                          ),
                          height: 40,
                          width: 500,
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(
                                'Area de responsabilidad:${element.area}'),
                          )),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                          ),
                          height: 60,
                          width: 500,
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child:
                                pw.Text('Descripción:${element.description}'),
                          )),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(),
                        ),
                        height: 130,
                        width: 125,
                        child: pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text('Tipo de movimiento:'),
                        ),
                      ),
                      pw.Container(
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(),
                        ),
                        height: 130,
                        width: 125,
                        child: pw.ListView(
                          children: TypeMovement.values.map((type) {
                            return pw.Padding(
                              padding: const pw.EdgeInsets.all(8.0),
                              child: pw.Row(
                                children: [
                                  type == element.type
                                      ? pw.Container(
                                          height: 12,
                                          width: 12,
                                          decoration: const pw.BoxDecoration(
                                              color: PdfColor.fromInt(0),
                                              shape: pw.BoxShape.circle))
                                      : pw.Container(
                                          height: 12,
                                          width: 12,
                                          decoration: const pw.BoxDecoration(
                                              shape: pw.BoxShape.circle)),
                                  pw.SizedBox(width: 10),
                                  pw.Text(type.toString())
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      element.type == TypeMovement.multipleInterno ||
                              element.type == TypeMovement.multipleExterno
                          ? pw.Container(
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(),
                              ),
                              height: 130,
                              width: 249,
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.all(8.0),
                                child: pw.Text(
                                    'El movimiento comprende ${element.medios.length} medios básicos'),
                              ),
                            )
                          : pw.Container(
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(),
                              ),
                              height: 130,
                              width: 125,
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.all(8.0),
                                child: pw.Text('Medio básico:'),
                              )),
                      element.type == TypeMovement.multipleInterno ||
                              element.type == TypeMovement.multipleExterno
                          ? pw.Container(
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(),
                              ),
                              height: 130,
                              width: 0,
                            )
                          : pw.Container(
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(),
                              ),
                              height: 130,
                              width: 125,
                              child: pw.Column(
                                children: [
                                  pw.Container(
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      height: 65,
                                      width: 150,
                                      child: pw.Padding(
                                        padding: const pw.EdgeInsets.all(8.0),
                                        child: pw.Text(
                                            'Subclasificación: \n\n${element.medios[0].subclassification}'),
                                      )),
                                  pw.Container(
                                      decoration: pw.BoxDecoration(
                                        border: pw.Border.all(),
                                      ),
                                      height: 65,
                                      width: 150,
                                      child: pw.Padding(
                                        padding: const pw.EdgeInsets.all(8.0),
                                        child: pw.Text(
                                            'Rótulo:\n\n${element.medios[0].rotulo}'),
                                      )),
                                ],
                              )),
                    ],
                  ),
                  pw.Row(
                    children: [
                      pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                          ),
                          height: 40,
                          width: 400,
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Nombre:${element.name}'),
                          )),
                      pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                          ),
                          height: 40,
                          width: 100,
                          child: pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Firma:'),
                          )),
                    ],
                  ),
                  element.type == TypeMovement.multipleInterno ||
                          element.type == TypeMovement.multipleExterno
                      ? pw.Column(children: [
                          pw.SizedBox(height: 10),
                          pw.Row(children: [
                            pw.Text('Medios básicos'),
                          ]),
                          pw.SizedBox(height: 10),
                          pw.SizedBox(
                            height: 300,
                            child: pw.Padding(
                              padding: const pw.EdgeInsets.all(1.0),
                              child: pw.ListView(
                                children: [
                                  for (var medio in element.medios)
                                    pw.Container(
                                      child: pw.Row(children: [
                                        pw.Text(
                                            '${medio.rotulo} | ${medio.rotulo} | Area:  ${medio.area} '),
                                      ]),
                                    ),
                                  pw.SizedBox(height: 10),
                                ],
                              ),
                            ),
                          )
                        ])
                      : pw.Container(),
                ],
              ),
            );
          },
        ),
      );
    }

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/Reporte de movimiento.pdf');
    await file.writeAsBytes(await pdf.save());

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Generar reporte'),
            Text(
              typeReport,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          BlocBuilder<MovementBloc, BaseState<List<MovementEntity>>>(
              builder: (context, state) => state.maybeWhen(success: (data) {
                    return IconButton(
                      onPressed: () {
                        exportPDF(data, typeReport);
                      },
                      icon: const Icon(CupertinoIcons.cloud_download),
                    );
                  }, orElse: () {
                    return Container();
                  })),
        ],
      ),
      body: BlocBuilder<MovementBloc, BaseState<List<MovementEntity>>>(
        builder: (context, state) => state.when(
          initial: Container.new,
          loading: () => const CupertinoActivityIndicator(),
          error: (error) {
            return Center(child: Text(error.toString()));
          },
          empty: () {
            return const Center(
              child: Text('No existen movimientos de este tipo'),
            );
          },
          success: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTable(
                      data: data[index],
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}

class CustomTable extends StatelessWidget {
  const CustomTable({
    super.key,
    required this.data,
  });

  final MovementEntity data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 616,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 40,
                      width: 450,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Entidad:${data.entity}'),
                      )),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 40,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Numero:${data.role}'),
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 40,
                      width: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Centro de costo:${data.costCenter}'),
                      )),
                ],
              ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 40,
                      width: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Area de responsabilidad:${data.area}'),
                      )),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 60,
                      width: 600,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Descripción:${data.description}'),
                      )),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 220,
                      width: 150,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Tipo de movimiento:'),
                      )),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    height: 220,
                    width: 180,
                    child: ListView(
                      children: TypeMovement.values.map((type) {
                        return RadioListTile<TypeMovement>(
                          title: Text(
                            type.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          toggleable: false,
                          value: type,
                          activeColor: Colors.black,
                          groupValue: data.type,
                          onChanged: null,
                          isThreeLine: false,
                        );
                      }).toList(),
                    ),
                  ),
                  data.type == TypeMovement.multipleInterno ||
                          data.type == TypeMovement.multipleExterno
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          height: 220,
                          width: 269,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'El movimiento comprende ${data.medios.length} medios básicos'),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          height: 220,
                          width: 120,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Medio básico:'),
                          )),
                  data.type == TypeMovement.multipleInterno ||
                          data.type == TypeMovement.multipleExterno
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          height: 220,
                          width: 0,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          height: 220,
                          width: 150,
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  height: 110,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'Subclasificación: \n\n${data.medios[0].subclassification}'),
                                  )),
                              Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  height: 108,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        'Rótulo:\n\n${data.medios[0].rotulo}'),
                                  )),
                            ],
                          ),
                        )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 40,
                      width: 450,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Nombre:${data.name}'),
                      )),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      height: 40,
                      width: 150,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Firma:'),
                      )),
                ],
              ),
              data.type == TypeMovement.multipleInterno ||
                      data.type == TypeMovement.multipleExterno
                  ? SizedBox(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ListView.builder(
                          itemCount: data.medios.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              subtitle: Text(
                                  'Rótulo: ${data.medios[index].rotulo}  |  Area: ${data.medios[index].area}'),
                              title: Text(data.medios[index].subclassification),
                            );
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

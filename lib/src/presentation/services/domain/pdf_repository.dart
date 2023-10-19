import 'dart:developer';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class PDFRepository {
  var columnNames = ['Subclasificación', 'Cantidad'];

  Future<Result<void>> exportPDF(List<MedioEntity> data, String area) async {
    try {
      var status = await Permission.storage.status;
      if (status.isDenied) {
        await Permission.storage.request();
      } else {
        final pdfFile = await generatePdf(data, area);

        await OpenFile.open(pdfFile.path);
      }

      return Success(data: null);
    } catch (error) {
      log(error.toString());
      return Failure(message: error.toString());
    }
  }

  Future<File> generatePdf(List<dynamic> data, String area) async {
    final pdf = pw.Document();

    String getFormattedDate(DateTime dateTime) {
      final dayOfWeek = DateFormat.EEEE('es').format(dateTime);
      final day = DateFormat.d().format(dateTime);
      final month = DateFormat.MMMM('es').format(dateTime);
      final year = DateFormat.y().format(dateTime);
      final time = DateFormat.jm().format(dateTime);

      return '$dayOfWeek, $day de $month de $year a las $time';
    }

    const itemsPerPageFirstPage = 20;
    const itemsPerPageSubsequentPages = 25;
    final items = data;
    final totalItems = items.length;

    pdf.addPage(
      pw.Page(
        build: (context) {
          final currentPageItems = items.take(itemsPerPageFirstPage).toList();
          final currentPageItemCount = currentPageItems.length;

          return pw.Column(
            children: [
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(width: 20),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Reporte de inventario del area: $area',
                      ),
                      pw.SizedBox(height: 15),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'Fecha: ${getFormattedDate(DateTime.now())}',
                      ),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                data: [
                  columnNames,
                  ...currentPageItems.map(
                    (item) => [
                      item.subclassification,
                      item.cant.toString(),
                    ],
                  ),
                ],
                cellAlignment: pw.Alignment.center,
              ),
              pw.SizedBox(height: 15),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'Página 1 - $currentPageItemCount de $totalItems elementos',
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    final totalSubsequentPages =
        (totalItems / itemsPerPageSubsequentPages).ceil();

    for (var i = itemsPerPageFirstPage;
        i < totalItems;
        i += itemsPerPageSubsequentPages) {
      final start = i;
      final end = (i + itemsPerPageSubsequentPages < totalItems)
          ? i + itemsPerPageSubsequentPages
          : totalItems;
      final pageItems = items.sublist(start, end);
      final currentPage = (start ~/ itemsPerPageSubsequentPages) + 2;
      final currentPageItemCount = pageItems.length;

      pdf.addPage(
        pw.Page(
          build: (context) {
            return pw.Column(
              children: [
                pw.Table.fromTextArray(
                  data: pageItems
                      .map(
                        (item) => [
                          item.subclassification,
                          item.cant.toString(),
                        ],
                      )
                      .toList(),
                  cellAlignment: pw.Alignment.center,
                ),
                pw.SizedBox(height: 15),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Text(
                      'Página $currentPage - $currentPageItemCount de $totalItems elementos',
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    }

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/inventario.pdf');
    await file.writeAsBytes(await pdf.save());

    return file;
  }
}

// ignore_for_file: non_constant_identifier_names, file_names, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:inventory_tesis/src/presentation/forms/medio_form.dart';
import 'package:inventory_tesis/src/presentation/pages/widgets/custom_buttons.dart';
import 'package:inventory_tesis/src/presentation/presentation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:screenshot/screenshot.dart';

@RoutePage()
class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({super.key});

  @override
  createState() => _GenerateQRPage();
}

class _GenerateQRPage extends State<GenerateQRPage> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final generateQRBloc = BlocProvider.of<GenerateQRBloc>(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocListener<GenerateQRBloc, GenerateQRState>(
        listener: (context, state) {
          if (state is LoadingGenerateQRState) {
            const CircularProgressIndicator.adaptive();
          } else if (state is FailureGenerateQRState) {
            context.router.pop();
            showToast(
              state.error,
              duration: const Duration(seconds: 2),
              position: ToastPosition.bottom,
              backgroundColor: Colors.red,
            );
          } else if (state.qr != null) {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.subClassification!.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Screenshot(
                          controller: screenshotController,
                          child: state.qr,
                        ),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      double pixelRatio =
                          MediaQuery.of(context).devicePixelRatio;
                      screenshotController
                          .capture(
                        delay: const Duration(milliseconds: 10),
                        pixelRatio: pixelRatio,
                      )
                          .then((image) async {
                        if (image != null) {
                          final directory =
                              await getApplicationDocumentsDirectory();
                          final imagePath = await File(
                                  '${directory.path}/${state.subClassification!.toString()}.png')
                              .create();
                          await imagePath.writeAsBytes(image);
                          ImageGallerySaver.saveFile(imagePath.path);
                          showToast(
                            'Imagen Guardada exitosamente',
                            position: ToastPosition.bottom,
                            backgroundColor: Colors.green,
                          );
                          context.router.pop();
                        }
                      }).catchError((onError) {
                        log(onError.toString());
                      });
                    },
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            );
          }
        },
        child: GenerateQRForm(generateQRBloc: generateQRBloc),
      ),
    );
  }
}

class GenerateQRForm extends StatelessWidget {
  final GenerateQRBloc generateQRBloc;

  const GenerateQRForm({super.key, required this.generateQRBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generar Qr')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: MedioFormEntityFormBuilder(
          builder: (BuildContext context, MedioFormEntityForm formModel,
              Widget? child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReactiveTextField<String>(
                  formControlName: MedioFormEntityForm.rotuloControlName,
                  validationMessages: {
                    'required': (text) => 'El rótulo del medio es obligatorio',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Rótulo del medio básico',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName: MedioFormEntityForm.areaControlName,
                  validationMessages: {
                    'required': (text) => 'El área a asignar es obligatoria',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Área',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName:
                      MedioFormEntityForm.subclassificationControlName,
                  validationMessages: {
                    'required': (text) =>
                        'La Subclasificación del medio es obligatoria',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Subclasificación',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: BlocBuilder<GenerateQRBloc, GenerateQRState>(
                    builder: (context, state) {
                      if (state is LoadingGenerateQRState) {
                        return const PrimaryButton(
                          isLoading: true,
                          text: 'Generando',
                        );
                      } else {
                        return PrimaryButton(
                            onPressed: () {
                              formModel.form.markAllAsTouched();
                              if (formModel.form.invalid) return;
                              generateQRBloc.add(
                                GenerateQr(
                                  medioFormEntity: formModel.model,
                                ),
                              );
                            },
                            text: 'Generar Qr');
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

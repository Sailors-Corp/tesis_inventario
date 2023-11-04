// ignore_for_file: non_constant_identifier_names, file_names, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:inventory_tesis/src/presentation/pages/views/medio_form_view.dart';
import 'package:inventory_tesis/src/presentation/presentation.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar QR'),
      ),
      body: GestureDetector(
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
                              'Imagen guardada exitosamente',
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
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: MedioFormView(),
          ),
        ),
      ),
    );
  }
}

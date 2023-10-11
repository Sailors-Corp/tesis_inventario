// ignore_for_file: non_constant_identifier_names, file_names, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:inventory_tesis/common/theme/app_colors.dart';
import 'package:inventory_tesis/features/generateQR/presentation/bloc/generate_qr_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

@RoutePage()
class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({super.key});

  @override
  createState() => _GenerateQRPage();
}

class _GenerateQRPage extends State<GenerateQRPage> {
  late TextEditingController _nombreController;
  late TextEditingController _subClasificacionController;
  late TextEditingController _rotuloController;
  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _nombreController = TextEditingController();
    _subClasificacionController = TextEditingController();
    _rotuloController = TextEditingController();

    super.initState();
  }

  void _clearForm() {
    _nombreController.clear();
    _subClasificacionController.clear();
    _rotuloController.clear();
    _keyForm.currentState?.reset();
  }

  @override
  void dispose() {
    _nombreController.clear();
    _subClasificacionController.clear();
    _rotuloController.clear();
    _nombreController.dispose();
    _subClasificacionController.dispose();
    _rotuloController.dispose();
    super.dispose();
  }

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
            _clearForm();
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.nombre!.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
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
                                  '${directory.path}/${state.nombre!.toString()}.png')
                              .create();
                          await imagePath.writeAsBytes(image);
                          ImageGallerySaver.saveFile(imagePath.path);
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
        child: GenerateQRForm(
            keyForm: _keyForm,
            nombreController: _nombreController,
            subClasificacionController: _subClasificacionController,
            rotuloController: _rotuloController,
            generateQRBloc: generateQRBloc),
      ),
    );
  }
}

class GenerateQRForm extends StatelessWidget {
  const GenerateQRForm({
    super.key,
    required GlobalKey<FormState> keyForm,
    required TextEditingController nombreController,
    required TextEditingController subClasificacionController,
    required TextEditingController rotuloController,
    required this.generateQRBloc,
  })  : _keyForm = keyForm,
        _nombreController = nombreController,
        _rotuloController = rotuloController,
        _subClasificacionController = subClasificacionController;

  final GlobalKey<FormState> _keyForm;
  final TextEditingController _nombreController;
  final TextEditingController _subClasificacionController;
  final TextEditingController _rotuloController;
  final GenerateQRBloc generateQRBloc;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Generar QR"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1.0,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    controller: _nombreController,
                    cursorColor: AppColors.primaryBlue,
                    decoration: const InputDecoration(
                      hintText: "Nombre",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1.0,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    controller: _subClasificacionController,
                    cursorColor: AppColors.primaryBlue,
                    decoration: const InputDecoration(
                      hintText: "Subclasificación",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1.0,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    controller: _rotuloController,
                    cursorColor: AppColors.primaryBlue,
                    decoration: const InputDecoration(
                      hintText: "Rótulo",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: BlocBuilder<GenerateQRBloc, GenerateQRState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          generateQRBloc.add(
                            GenerateQr(
                              _nombreController.text,
                              _subClasificacionController.text,
                              _rotuloController.text,
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (state is LoadingGenerateQRState)
                              ? const CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.white,
                                )
                              : const SizedBox(width: 0),
                          const SizedBox(width: 10),
                          const Text('Generar QR'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

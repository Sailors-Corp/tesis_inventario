// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:developer';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';
import 'package:inventory_tesis/src/presentation/presentation.dart';
import 'package:oktoast/oktoast.dart';
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

  GlobalKey rootWidgetKey = GlobalKey();

  List<Uint8List> images = [];

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

  _capturePng() async {
    RenderRepaintBoundary? boundary = rootWidgetKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary?;
    var image = await boundary!.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }

  _savePng(Uint8List pngBytes) async {
    try {
      ImageGallerySaver.saveImage(pngBytes);
    } catch (e) {
      log(e.toString());
    }
  }

  _sharePng(Uint8List pngBytes) async {
    try {
      final result = await ImageGallerySaver.saveImage(pngBytes);
      if (result != null) {
        Share.shareFiles([result]);
      }
    } catch (e) {
      log(e.toString());
    }
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
                      state.subClassification!.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RepaintBoundary(
                      key: rootWidgetKey,
                      child: Center(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: state.qr,
                        ),
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => _savePng(_capturePng()),
                    child: const Text('Guardar'),
                  ),
                  TextButton(
                    onPressed: () => _sharePng(_capturePng()),
                    child: const Text('Compartir'),
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
                    controller: _rotuloController,
                    cursorColor: AppColors.primaryColor,
                    decoration: const InputDecoration(
                      hintText: "Rótulo",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.numbers,
                          color: AppColors.primaryColor,
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
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Material(
                  elevation: 1.0,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: TextFormField(
                    autocorrect: true,
                    keyboardType: TextInputType.text,
                    controller: _subClasificacionController,
                    cursorColor: AppColors.primaryColor,
                    decoration: const InputDecoration(
                      hintText: "Subclasificación",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.grid_view_outlined,
                          color: AppColors.primaryColor,
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
                    controller: _nombreController,
                    cursorColor: AppColors.primaryColor,
                    decoration: const InputDecoration(
                      hintText: "Area",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Icon(
                          Icons.app_registration,
                          color: AppColors.primaryColor,
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
                          (state is LoadingGenerateQRState)
                              ? const Text('Generando')
                              : const Text('Generar QR'),
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

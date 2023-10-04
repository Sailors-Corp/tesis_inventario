import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/features/domain/repositories/generate_qr_repository.dart';
import 'package:qr_flutter/qr_flutter.dart';

part 'generate_qr_event.dart';
part 'generate_qr_state.dart';

class GenerateQRBloc extends Bloc<GenerateQREvent, GenerateQRState> {
  GenerateQRBloc(
    this.generateQRRepository,
  ) : super(const GenerateQRState()) {
    on<GenerateQr>(_generateQR);
  }

  final GenerateQRRepository generateQRRepository;

  Future<void> _generateQR(
      GenerateQr event, Emitter<GenerateQRState> emit) async {
    emit(LoadingGenerateQRState());

    await Future.delayed(const Duration(seconds: 1));

    final response = await generateQRRepository.generateQR(
        event.nombre, event.subClasificacion, event.rotulo);
    String name = event.nombre;
    if (response != null) {
      emit(state.copyWith(qr: response, nombre: name));
    } else {
      emit(
        const FailureGenerateQRState(
            "Ha ocurrido un error inesperado al generar el QR"),
      );
    }
  }
}
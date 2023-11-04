// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';

part 'scan_state.dart';
// ...

class ScanCubit extends Cubit<ScanState> {
  ScanCubit(
    this._scanRepository,
  ) : super(ScanInitial());

  final ScanRepository _scanRepository;

  Future<void> scan(String rotulo, String area) async {
    emit(ScanLoading());

    try {
      final response = await _scanRepository.scan(rotulo, area);
      emit(ScanSuccess(correctPosition: response));
    } catch (error) {
      emit(ScanError(error.toString()));
    }
  }

  Future<void> takeInventory(String rotulo, String area, String invArea) async {
    emit(ScanLoading());

    final response = await _scanRepository.takeInventory(rotulo, area, invArea);

    // Verificar después de hacer el inventario entero
    final percent = await _scanRepository.percentInventory(invArea);
    double percentRound = double.parse((percent / 100).toStringAsFixed(2));
    log("Percent: => ${percent / 100}");
    log("PercentRound: => $percentRound");
    emit(ScanSuccessPercent(correctPosition: response, percent: percentRound));
  }

  Future<void> getPercent(String invArea) async {
    emit(ScanLoading());

    final percent = await _scanRepository.percentInventory(invArea);
    log("Percent: => ${percent / 100}");
    double percentRound = double.parse((percent / 100).toStringAsFixed(2));
    log("PercentRound: => $percentRound");

    emit(ScanSuccessPercent(percent: percentRound / 100));
  }
}

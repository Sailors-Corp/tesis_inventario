// ignore_for_file: public_member_api_docs, sort_constructors_first
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

      final response = await _scanRepository.scan(rotulo, area);
      emit(ScanSuccess(isCorrectPosition: response));
    } catch (error) {
      emit(ScanError(error.toString()));
    }
    try {
  }

  Future<void> takeInventory(String rotulo, String area, String invArea) async {
    emit(ScanLoading());

    final response = await _scanRepository.takeInventory(rotulo, area, invArea);

    emit(ScanSuccess(isCorrectPosition: response));
  }

  Future<void> getPercent(String area, String invArea) async {
    emit(ScanLoading());

    final response = await _scanRepository.percentInventory(invArea);
    emit(ScanSuccessPecent(percent: response));
  }
}

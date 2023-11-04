import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/inventory_entity.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';

part 'medios_inventoried_event.dart';

class MediosInventoriedBloc
    extends Bloc<MedioInventoriedEvent, BaseState<InventoryEntity>> {
  MediosInventoriedBloc(this.scanRepository)
      : super(const BaseState.initial()) {
    on<MediosInventoriedLoaded>(_onMediosInventoriedLoaded);
    on<MediosInventoriedClosed>(_onMediosInventoriedClosed);
  }
  final ScanRepository scanRepository;

  FutureOr<void> _onMediosInventoriedLoaded(MediosInventoriedLoaded event,
      Emitter<BaseState<InventoryEntity>> emit) async {
    emit(const BaseState.loading());

    final response = await scanRepository.getMediosInventoried();

    final newState = switch (response) {
      Success(:final data) => BaseState<InventoryEntity>.success(data: data),
      Failure(:final message) => BaseState<InventoryEntity>.error(
          message: message,
        )
    };

    emit(newState);
  }

  FutureOr<void> _onMediosInventoriedClosed(MediosInventoriedClosed event,
      Emitter<BaseState<InventoryEntity>> emit) async {
    await scanRepository.closeInventory();
  }
}

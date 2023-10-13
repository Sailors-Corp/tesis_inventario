import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/domain/repositories/db_repository.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';

class AreaDetailBloc extends Bloc<AreaEvent, BaseState<List<MedioEntity>>> {
  AreaDetailBloc(this._dataBaseRepository) : super(const BaseState.initial()) {
    on<AreaDetailLoaded>(_onAreaDetailLoaded);
  }

  final DataBaseRepository _dataBaseRepository;

  FutureOr<void> _onAreaDetailLoaded(AreaDetailLoaded event,
      Emitter<BaseState<List<MedioEntity>>> emit) async {
    emit(const BaseState.loading());

    final response = await _dataBaseRepository.getItemsByArea(event.area);

    final newState = switch (response) {
      Success(:final data) when data.isEmpty =>
        const BaseState<List<MedioEntity>>.empty(),
      Success(:final data) =>
        BaseState<List<MedioEntity>>.success(data: data as List<MedioEntity>),
      Failure(:final message) => BaseState<List<MedioEntity>>.error(
          message: message,
        )
    };
    emit(newState);
  }
}

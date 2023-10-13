import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/domain/repositories/db_repository.dart';

part 'area_event.dart';

final class AreaBloc extends Bloc<AreaEvent, BaseState<List<String?>>> {
  AreaBloc(this._dataBaseRepository) : super(const BaseState.initial()) {
    on<AreasLoaded>(_onAreaLoaded);
  }

          final DataBaseRepository _dataBaseRepository;

  FutureOr<void> _onAreaLoaded(
      AreasLoaded event, Emitter<BaseState<List<String?>>> emit) async {
    emit(const BaseState.loading());

    final response = await _dataBaseRepository.getAllData();

    final newState = switch (response) {
      Success(:final data) when data.isEmpty =>
        const BaseState<List<String?>>.empty(),
      Success(:final data) => BaseState<List<String?>>.success(data: data),
      Failure(:final message) => BaseState<List<String?>>.error(
          message: message,
        )
    };

    emit(newState);
  }
}

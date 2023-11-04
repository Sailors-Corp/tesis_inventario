import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/data/datasources/db_datasource.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState<void>> {
  HomeBloc(this._dbDataSources) : super(const BaseState.initial()) {
    on<DataBaseImported>(_onChargedBD);
    on<DeleteDataBase>(_deleteDataBase);
  }
  final DataBaseDataSources _dbDataSources;

  Future<FutureOr<void>> _onChargedBD(
      DataBaseImported event, Emitter<BaseState<void>> emit) async {
    emit(const BaseState.loading());

    final response = await _dbDataSources.importDataBase();

    final newState = switch (response) {
      true => const BaseState.success(data: true),
      false => const BaseState.error(message: '')
    };
    emit(newState);
  }

  FutureOr<void> _deleteDataBase(
      DeleteDataBase event, Emitter<BaseState<void>> emit) async {
    await _dbDataSources.importDataBase();
  }
}

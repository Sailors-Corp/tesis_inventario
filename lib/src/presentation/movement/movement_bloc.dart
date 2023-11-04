import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:inventory_tesis/src/domain/repositories/db_repository.dart';

part 'movement_event.dart';

class MovementBloc
    extends Bloc<MovementEvent, BaseState<List<MovementEntity>>> {
  MovementBloc(this.dataBaseRepository) : super(const BaseState.initial()) {
    on<MovementLoaded>(_movementLoaded);
  }

  final DataBaseRepository dataBaseRepository;

  FutureOr<void> _movementLoaded(MovementLoaded event,
      Emitter<BaseState<List<MovementEntity>>> emit) async {
    late dynamic response;

    emit(const BaseState.loading());

    response = await dataBaseRepository.getMovementByType(event.type!);

    final newState = switch (response) {
      Success(:final data) =>
        BaseState<List<MovementEntity>>.success(data: data),
      Failure(:final message) =>
        BaseState<List<MovementEntity>>.error(message: message),
      Object() => null,
      null => null,
    };
    emit(newState!);
  }
}

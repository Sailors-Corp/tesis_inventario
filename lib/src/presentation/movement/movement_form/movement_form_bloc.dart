import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/domain/repositories/db_repository.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';

part 'movement_form_event.dart';

class MovementFormBloc extends Bloc<MovementFormEvent, BaseState<bool>> {
  MovementFormBloc(this.dataBaseRepository)
      : super(const BaseStateInitial<bool>()) {
    on<MovementUpserted>(_onMovementUpserted);
  }

  final DataBaseRepository dataBaseRepository;

  FutureOr<void> _onMovementUpserted(
    MovementUpserted event,
    Emitter<BaseState<bool>> emit,
  ) async {
    emit(const BaseState.loading());

    final response = await dataBaseRepository.insertMovement(
        event.movementFormEntity, event.medios);

    final nextState = switch (response) {
      Success() => const BaseState<bool>.success(data: true),
      Failure(:final message) => BaseState<bool>.error(message: message)
    };

    emit(nextState);
  }
}

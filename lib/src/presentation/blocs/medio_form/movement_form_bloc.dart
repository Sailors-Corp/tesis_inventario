import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/repositories/db_repository.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';

part 'movement_form_event.dart';

class MovementFormBloc
    extends Bloc<MovementFormEvent, BaseState<MovementFormEntity>> {
  MovementFormBloc(this.dataBaseRepository) : super(const BaseStateInitial()) {
    on<ItemUpserted>(_onItemUpserted);
  }

  final DataBaseRepository dataBaseRepository;

  FutureOr<void> _onItemUpserted(
    ItemUpserted event,
    Emitter<BaseState<MovementFormEntity>> emit,
  ) async {
    emit(const BaseState.loading());

    final response =
        await dataBaseRepository.insertMovement(event.movementFormEntity);

    final nextState = switch (response) {
      Success(:final data) => const BaseState.success(data: true),
      Failure(:final message) =>
        BaseState<MovementFormEntity>.error(message: message)
    };

    emit(nextState as BaseState<MovementFormEntity>);
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/domain/enums/type_movement.dart';

part 'type_movement_form_event.dart';

class TypeMovementFormBloc
    extends Bloc<TypeMovementFormEvent, BaseState<bool>> {
  TypeMovementFormBloc() : super(const BaseState.initial()) {
    on<TypeChange>(_onTypeChange);
  }

  FutureOr<void> _onTypeChange(
      TypeChange event, Emitter<BaseState<bool>> emit) async {
    emit(const BaseState.loading());

    if (event.typeMovement == TypeMovement.multipleInterno ||
        event.typeMovement == TypeMovement.multipleExterno) {
      emit(const BaseState.success(data: true));
    } else {
      emit(const BaseState.empty());
    }
  }
}

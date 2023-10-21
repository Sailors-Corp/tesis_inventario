import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/core/utils/result.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/presentation/services/export_pdf/pdf_repository.dart';

part 'report_event.dart';

class ReportBloc extends Bloc<ReportEvent, BaseState<void>> {
  ReportBloc(this._pdfRepository) : super(const BaseState.initial()) {
    on<ReportExported>(_onInventoryExported);
  }

  final PDFRepository _pdfRepository;

  FutureOr<void> _onInventoryExported(
    ReportExported event,
    Emitter<BaseState<void>> emit,
  ) async {
    emit(const BaseState.loading());

    final response = await _pdfRepository.exportPDF(event.data, event.area);

    final newState = switch (response) {
      Success(:final data) => const BaseState<void>.success(data: null),
      Failure(:final message) => BaseState<void>.error(message: message),
    };
  }
}

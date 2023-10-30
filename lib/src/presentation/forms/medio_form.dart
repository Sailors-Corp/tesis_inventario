// ignore_for_file: inference_failure_on_instance_creation

import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'medio_form.gform.dart';

@Rf()
class MedioFormEntity extends Equatable {
  const MedioFormEntity({
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.rotulo = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.subclassification = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.area = '',
  });

  factory MedioFormEntity.fromEntity(MedioEntity? entity) {
    if (entity == null) return const MedioFormEntity();
    return MedioFormEntity(
      rotulo: entity.rotulo,
      area: entity.area,
      subclassification: entity.subclassification,
    );
  }

  final String rotulo;
  final String area;
  final String subclassification;

  @override
  List<Object?> get props => [
        area,
        rotulo,
        subclassification,
      ];
}

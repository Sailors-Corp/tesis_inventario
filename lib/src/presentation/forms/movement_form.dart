// ignore_for_file: inference_failure_on_instance_creation

import 'package:equatable/equatable.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'movement_form.gform.dart';

@Rf()
class MovementFormEntity extends Equatable {
  const MovementFormEntity({
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.id = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.entity = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.costCenter = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.description = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.name = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.role = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.idMedio = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.type = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.subclassification = '',
    @RfControl(
      validators: [RequiredValidator()],
    )
    this.area = '',
  });

  factory MovementFormEntity.fromEntity(MovementEntity? entity) {
    if (entity == null) return const MovementFormEntity();
    return MovementFormEntity(
      idMedio: entity.idMedio,
      area: entity.area,
      subclassification: entity.subclassification,
      costCenter: entity.costCenter,
      description: entity.description,
      role: entity.role,
      name: entity.name,
      type: entity.type,
      entity: entity.entity,
    );
  }

  final String id;
  final String entity;
  final String costCenter;
  final String area;
  final String description;
  final String name;
  final String role;
  final String idMedio;
  final String type;
  final String subclassification;

  @override
  List<Object?> get props => [
        id,
        entity,
        costCenter,
        area,
        description,
        name,
        role,
        idMedio,
        type,
        subclassification,
      ];
}

// abstract final class ItemFormMapper {
//   static const nameControl = 'rotulo';
//   static const priceControl = 'area';
//   static const stockControl = 'stock';
//   static const imageUrlControl = 'imageUrl';

//   FormGroup entityToForm(ItemEntity entity) {
//     return FormGroup({
//       nameControl: FormControl<String>(),
//       priceControl: FormControl<double>(),
//       stockControl: FormControl<int>(),
//       imageUrlControl: FormControl<String?>(),
//     });
//   }

//   ItemFormEntity formToEntity(FormGroup formGroup) {
//     final rotulo = formGroup.control(nameControl).value as String;
//     final area = formGroup.control(priceControl).value as double;
//     final stock = formGroup.control(stockControl).value as int;
//     final imageUrl = formGroup.control(imageUrlControl).value as String?;

//     return ItemFormEntity(
//       rotulo: rotulo,
//       area: area,
//       stock: stock,
//       imageUrl: imageUrl,
//     );
//   }
// }

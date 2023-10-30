// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/domain/mapper/medio_mapper.dart';
import 'package:inventory_tesis/src/presentation/forms/medio_form.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class MedioFormView extends StatelessWidget {
  MedioFormView({super.key, required this.newMedio});

  MedioEntity newMedio;

  @override
  Widget build(BuildContext context) {
    return MedioFormEntityFormBuilder(
      model: MedioFormEntity.fromEntity(newMedio),
      builder:
          (BuildContext context, MedioFormEntityForm formModel, Widget? child) {
        return AlertDialog(
          title: const Text('Agregar Medio'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReactiveTextField<String>(
                formControlName: MedioFormEntityForm.rotuloControlName,
                validationMessages: {
                  'required': (text) => 'El rótulo del medio es obligatorio',
                },
                decoration: const InputDecoration(
                  labelText: 'Rótulo del medio básico',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ReactiveTextField<String>(
                formControlName: MedioFormEntityForm.areaControlName,
                validationMessages: {
                  'required': (text) => 'El área a asignar es obligatoria',
                },
                decoration: const InputDecoration(
                  labelText: 'Área',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ReactiveTextField<String>(
                formControlName:
                    MedioFormEntityForm.subclassificationControlName,
                validationMessages: {
                  'required': (text) =>
                      'La Subclasificación del medio es obligatoria',
                },
                decoration: const InputDecoration(
                  labelText: 'Subclasificación',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                formModel.form.markAllAsTouched();
                if (formModel.form.invalid) return;
                newMedio = MedioMapper.formToEntity(formModel.model);
                Navigator.of(context).pop(newMedio);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

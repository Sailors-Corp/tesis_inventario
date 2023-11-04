// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:inventory_tesis/src/presentation/forms/medio_form.dart';
import 'package:inventory_tesis/src/presentation/pages/widgets/custom_buttons.dart';
import 'package:inventory_tesis/src/presentation/presentation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class MedioFormView extends StatelessWidget {
  const MedioFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MedioFormEntityFormBuilder(
      builder:
          (BuildContext context, MedioFormEntityForm formModel, Widget? child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gutter(),
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
              formControlName: MedioFormEntityForm.subclassificationControlName,
              validationMessages: {
                'required': (text) =>
                    'La Subclasificación del medio es obligatoria',
              },
              decoration: const InputDecoration(
                labelText: 'Subclasificación',
                border: OutlineInputBorder(),
              ),
            ),
            const Gutter(),
            BlocBuilder<GenerateQRBloc, GenerateQRState>(
              builder: (context, state) {
                return PrimaryButton(
                  isLoading: state is LoadingGenerateQRState ? true : false,
                  onPressed: () {
                    formModel.form.markAllAsTouched();
                    if (formModel.form.invalid) return;
                    context.read<GenerateQRBloc>().add(
                          GenerateQr(
                            medioFormEntity: formModel.model,
                          ),
                        );
                  },
                  text: 'Generar Qr',
                );
              },
            )
          ],
        );
      },
    );
  }
}

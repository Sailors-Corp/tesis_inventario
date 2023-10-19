import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/dependencies.dart';
import 'package:inventory_tesis/src/common/theme/theme.dart';
import 'package:inventory_tesis/src/core/errors/error_messages.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:inventory_tesis/src/presentation/blocs/medio_form/movement_form_bloc.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

@RoutePage()
class MovementPage extends StatelessWidget {
  const MovementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Realizar movimiento')),
      body: const SingleChildScrollView(
        child: MovementFormView(),
      ),
    );
  }
}

class MovementFormView extends StatelessWidget {
  const MovementFormView({
    this.itemToEdit,
    super.key,
  });

  final MovementEntity? itemToEdit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovementFormBloc>(
      create: (context) => injector(),
      child: MovementFormEntityFormBuilder(
        model: MovementFormEntity.fromEntity(itemToEdit),
        builder: (
          BuildContext context,
          MovementFormEntityForm formModel,
          Widget? child,
        ) {
          return Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                BlocBuilder<MovementFormBloc, BaseState<MovementFormEntity>>(
                  builder: (context, state) => state.when(
                    initial: Container.new,
                    loading: Container.new,
                    error: (error) => Align(
                      alignment: Alignment.centerLeft,
                      child: Material(
                        borderRadius: BorderRadius.circular(4),
                        elevation: 3,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            ErrorMessages.getMessage(
                              context,
                              error,
                            ),
                            style: const TextStyle(
                              color: AppColors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                    empty: Container.new,
                    success: (data) {
                      if (itemToEdit == null) {
                        formModel.reset();
                      }
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Material(
                          borderRadius: BorderRadius.circular(4),
                          elevation: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              itemToEdit == null
                                  ? 'El producto ha sido insertado correctamente'
                                  : 'El producto ha sido actualizado correctamente',
                              style: const TextStyle(
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName: MovementFormEntityForm.entityControlName,
                  validationMessages: {
                    'required': (text) =>
                        'El nombre de la entidad es obligatorio',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Entidad',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName: MovementFormEntityForm.costCenterControlName,
                  validationMessages: {
                    'required': (text) => 'El costo del centro es obligatorio',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Costo de centro',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName:
                      MovementFormEntityForm.descriptionControlName,
                  decoration: const InputDecoration(
                    labelText: 'Descripción',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName: MovementFormEntityForm.nameControlName,
                  validationMessages: {
                    'required': (text) => 'El nombre es obligatorio',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName: MovementFormEntityForm.roleControlName,
                  validationMessages: {
                    'required': (text) =>
                        'Debe especificar su rol',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Rol',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName: MovementFormEntityForm.idMedioControlName,
                  validationMessages: {
                    'required': (text) => 'El rotulo del medio es obligatorio',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Rótulo del medio básico',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName: MovementFormEntityForm.areaControlName,
                  validationMessages: {
                    'required': (text) => 'El area a asignar es obligatoria',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Area',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ReactiveTextField<String>(
                  formControlName:
                      MovementFormEntityForm.subclassificationControlName,
                  validationMessages: {
                    'required': (text) =>
                        'La clasificación del medio es obligatoria',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Subclasificación',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Tipo de movimiento',
                    floatingLabelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  child: Column(
                    children: [
                      ReactiveRadioListTile<String>(
                        value: 'Simple interno',
                        contentPadding: EdgeInsets.zero,
                        formControlName: MovementFormEntityForm.typeControlName,
                        title: const Text('Simple interno'),
                      ),
                      const SizedBox(width: 15),
                      ReactiveRadioListTile<String>(
                        value: 'Masivo interno',
                        contentPadding: EdgeInsets.zero,
                        formControlName: MovementFormEntityForm.typeControlName,
                        title: const Text('Masivo interno'),
                      ),
                      ReactiveRadioListTile<String>(
                        value: 'Simple externo',
                        contentPadding: EdgeInsets.zero,
                        formControlName: MovementFormEntityForm.typeControlName,
                        title: const Text('Simple externo'),
                      ),
                      const SizedBox(width: 15),
                      ReactiveRadioListTile<String>(
                        value: 'Masivo externo',
                        contentPadding: EdgeInsets.zero,
                        formControlName: MovementFormEntityForm.typeControlName,
                        title: const Text('Masivo externo'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BlocBuilder<MovementFormBloc,
                        BaseState<MovementFormEntity>>(
                      builder: (context, state) {
                        final content = switch (state) {
                          BaseStateLoading() => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CupertinoActivityIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                if (itemToEdit == null)
                                  const Text('Insertando')
                                else
                                  const Text('Actualizando'),
                              ],
                            ),
                          (_) => (itemToEdit == null)
                              ? const Text('Insertar')
                              : const Text('Actualizar'),
                        };
                        return FilledButton(
                          onPressed: () async {
                            formModel.form.markAllAsTouched();

                            if (formModel.form.invalid) return;

                            context.read<MovementFormBloc>().add(ItemUpserted(
                                movementFormEntity: formModel.model));

                            await Future.delayed(
                              const Duration(seconds: 3),
                            );
                          },
                          child: content,
                        );
                      },
                    ),
                    const SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: () {
                        final state = context.read<MovementFormBloc>().state;
                        if (state is BaseStateSuccess) {
                          context.router.pop(true);
                        } else {
                          context.router.pop(false);
                        }
                      },
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// id
// entity
// costCenter
// area
// description
// name
// role
// idMedio
// type
// subclassification
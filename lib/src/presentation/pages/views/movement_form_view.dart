// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/dependencies.dart';
import 'package:inventory_tesis/src/common/theme/theme.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/domain/entities/movement_entity.dart';
import 'package:inventory_tesis/src/domain/enums/type_movement.dart';
import 'package:inventory_tesis/src/domain/mapper/medio_mapper.dart';
import 'package:inventory_tesis/src/presentation/forms/medio_form.dart';
import 'package:inventory_tesis/src/presentation/forms/movement_form.dart';
import 'package:inventory_tesis/src/presentation/movement/movement_form/movement_form_bloc.dart';
import 'package:inventory_tesis/src/presentation/movement/type_movement_form_bloc/type_movement_form_bloc.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class MovementPageState extends ChangeNotifier {
  TypeMovement? selectedType;
  List<MedioEntity> medios = [];

  void setSelectedType(TypeMovement type) {
    selectedType = type;
    notifyListeners();
  }

  void addMedio(MedioEntity medio) {
    medios.add(medio);
    notifyListeners();
  }

  void removeMedio(MedioEntity medio) {
    medios.remove(medio);
    notifyListeners();
  }
}

@RoutePage()
class MovementPage extends StatelessWidget {
  const MovementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovementFormBloc>(
          create: (context) => injector(),
        ),
        BlocProvider<TypeMovementFormBloc>(
          create: (context) => injector(),
        ),
        ChangeNotifierProvider<MovementPageState>(
          create: (_) => MovementPageState(),
        ),
      ],
      child: const MovementFormView(),
    );
  }
}

class MovementFormView extends StatelessWidget {
  const MovementFormView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.watch<MovementPageState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Realizar movimiento'),
        actions: [
          BlocBuilder<TypeMovementFormBloc, BaseState<bool>>(
            builder: (context, state) {
              if (state is BaseStateSuccess) {
                return IconAddMedio(
                  pageState: pageState,
                );
              }
              if (state is BaseStateEmpty) {
                if (pageState.medios.isEmpty) {
                  return IconAddMedio(
                    pageState: pageState,
                  );
                } else {
                  return const SizedBox(width: 0);
                }
              } else {
                return const SizedBox(width: 0);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: MovementFormContent(
          pageState: pageState,
        ),
      ),
    );
  }
}

class IconAddMedio extends StatelessWidget {
  const IconAddMedio({
    super.key,
    required this.pageState,
  });

  final MovementPageState pageState;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final medio = await showDialog<MedioEntity>(
          context: context,
          builder: (_) {
            late MedioEntity? newMedio = const MedioEntity(
                rotulo: '', area: '', subclassification: '', cant: 0);
            return MedioFormEntityFormBuilder(
              model: MedioFormEntity.fromEntity(newMedio),
              builder: (BuildContext context, MedioFormEntityForm formModel,
                  Widget? child) {
                return AlertDialog(
                  title: const Text('Agregar Medio'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReactiveTextField<String>(
                        formControlName: MedioFormEntityForm.rotuloControlName,
                        validationMessages: {
                          'required': (text) =>
                              'El rótulo del medio es obligatorio',
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
                          'required': (text) =>
                              'El área a asignar es obligatoria',
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
          },
        );

        if (medio != null) {
          pageState.medios.add(medio);
        }

        context
            .read<TypeMovementFormBloc>()
            .add(TypeChange(pageState.selectedType!));
      },
      icon: const Icon(Icons.add),
    );
  }
}

class MovementFormContent extends StatelessWidget {
  const MovementFormContent({
    Key? key,
    this.itemToEdit,
    required this.pageState,
  }) : super(key: key);

  final MovementEntity? itemToEdit;
  final MovementPageState pageState;

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Detalles de usuario',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
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
                    'required': (text) => 'Debe especificar su rol',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Rol',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Detalles de movimiento',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
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
                  formControlName: MovementFormEntityForm.areaControlName,
                  validationMessages: {
                    'required': (text) => 'El área es obligatorio',
                  },
                  decoration: const InputDecoration(
                    labelText: 'Area de destino',
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
                      ReactiveRadioListTile<TypeMovement>(
                        onChanged: (v) {
                          pageState.setSelectedType(v.value!);
                          context
                              .read<TypeMovementFormBloc>()
                              .add(TypeChange(v.value!));
                        },
                        value: TypeMovement.simpleInterno,
                        contentPadding: EdgeInsets.zero,
                        formControlName: MovementFormEntityForm.typeControlName,
                        title: const Text('Simple interno'),
                      ),
                      ReactiveRadioListTile<TypeMovement>(
                        value: TypeMovement.multipleInterno,
                        contentPadding: EdgeInsets.zero,
                        formControlName: MovementFormEntityForm.typeControlName,
                        title: const Text('Masivo interno'),
                        onChanged: (v) {
                          pageState.setSelectedType(v.value!);
                          context
                              .read<TypeMovementFormBloc>()
                              .add(TypeChange(v.value!));
                        },
                      ),
                      ReactiveRadioListTile<TypeMovement>(
                        value: TypeMovement.simpleExterno,
                        contentPadding: EdgeInsets.zero,
                        formControlName: MovementFormEntityForm.typeControlName,
                        title: const Text('Simple externo'),
                        onChanged: (v) {
                          pageState.setSelectedType(v.value!);
                          context
                              .read<TypeMovementFormBloc>()
                              .add(TypeChange(v.value!));
                        },
                      ),
                      ReactiveRadioListTile<TypeMovement>(
                        value: TypeMovement.multipleExterno,
                        contentPadding: EdgeInsets.zero,
                        formControlName: MovementFormEntityForm.typeControlName,
                        title: const Text('Masivo externo'),
                        onChanged: (v) {
                          pageState.setSelectedType(v.value!);
                          context
                              .read<TypeMovementFormBloc>()
                              .add(TypeChange(v.value!));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Detalles de medios básicos',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                BlocBuilder<TypeMovementFormBloc, BaseState<bool>>(
                  builder: (context, state) {
                    if (state is BaseStateSuccess) {
                      if (pageState.medios.isEmpty) {
                        return const SizedBox(
                          height: 20,
                          child: Text('Aun sin medios básicos'),
                        );
                      } else {
                        return SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: pageState.medios.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (pageState.medios.isEmpty) {
                                return const Center(
                                    child: Text('Aun sin medios básicos'));
                              } else {
                                return ListTile(
                                  title: Text(
                                    pageState.medios[index].rotulo.toString(),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        pageState.removeMedio(
                                            pageState.medios[index]);
                                      },
                                      icon: const Icon(Icons.delete)),
                                );
                              }
                            },
                          ),
                        );
                      }
                    } else if (state is BaseStateEmpty) {
                      if (pageState.medios.isEmpty) {
                        return const SizedBox(
                          height: 20,
                          child: Text('Aun sin medios básicos'),
                        );
                      } else {
                        return SizedBox(
                          height: 100,
                          child: ListTile(
                            title: Text(
                              pageState.medios[0].rotulo.toString(),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  pageState.removeMedio(pageState.medios[0]);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ),
                        );
                      }
                    } else {
                      return const SizedBox(height: 10);
                    }
                  },
                ),
                const SizedBox(height: 15),
                CupertinoButton(
                  color: AppColors.primaryColor,
                  onPressed: () async {
                    formModel.form.markAllAsTouched();
                    log('Insertar');
                    if (formModel.form.invalid) return;
                    context.read<MovementFormBloc>().add(MovementUpserted(
                          medios: pageState.medios,
                          movementFormEntity: formModel.model,
                        ));

                    context.router.pop(true);
                  },
                  child: SizedBox(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Center(child: Text('Mover')),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

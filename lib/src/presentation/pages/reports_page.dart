import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/src/domain/enums/type_movement.dart';
import 'package:inventory_tesis/src/presentation/movement/movement_bloc.dart';
import 'package:inventory_tesis/src/presentation/pages/widgets/custom_buttons.dart';

@RoutePage()
class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  TypeMovement? selectedTypeMovement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Generar reportes'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Text(
              'Elige el tipo de reporte que desea realizar',
              style: TextStyle(fontSize: 18),
            ),
            const Gutter(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 400,
                child: Center(
                  child: ListView(
                    children: TypeMovement.values.map((type) {
                      return Card(
                        child: RadioListTile<TypeMovement>(
                          title: Text(type.toString()),
                          value: type,
                          groupValue: selectedTypeMovement,
                          onChanged: (value) {
                            setState(() {
                              selectedTypeMovement = value;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            selectedTypeMovement != null
                ? PrimaryButton(
                    text: 'Generar reporte',
                    onPressed: selectedTypeMovement == null
                        ? null
                        : () async {
                            if (selectedTypeMovement != null) {
                              context.read<MovementBloc>().add(MovementLoaded(
                                  selectedTypeMovement.toString()));
                              context.router.push(MovementReportRoute(
                                  typeReport: selectedTypeMovement.toString()));
                            }
                          },
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

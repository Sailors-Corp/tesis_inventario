import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/features/home/presentation/bloc/home_bloc.dart';
import 'package:oktoast/oktoast.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("UCInventory"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is SuccessHomeState) {}
              if (state is FailureHomeState) {
                showToast(
                  'Ha ocurrido algun error inesperado',
                  backgroundColor: Colors.red,
                );
              }
              return ElevatedButton(
                onPressed: () {
                  homeBloc.add(OnChargedBD());
                },
                child: const Row(
                  children: [
                    Icon(Icons.import_export),
                    Text('Importar BD'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

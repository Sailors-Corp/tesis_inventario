// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/common/theme/app_colors.dart';
import 'package:inventory_tesis/common/theme/app_text_styles.dart';
import 'package:inventory_tesis/injector.dart';
import 'package:inventory_tesis/src/data/datasources/db_datasource.dart';
import 'package:inventory_tesis/src/presentation/blocs/home/home_bloc.dart';
import 'package:inventory_tesis/src/presentation/components/sidebar.dart';
import 'package:oktoast/oktoast.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      ItemGrid(
        label: "Escanear",
        icon: Icons.qr_code_scanner_outlined,
        onTap: () {},
      ),
      ItemGrid(
        label: "Generar",
        icon: Icons.qr_code_2_outlined,
        onTap: () {
          // context.router.push(const GenerateQRRoute());
        },
      ),
      ItemGrid(
        label: "Buscar",
        icon: Icons.search_outlined,
        onTap: () {},
      ),
      ItemGrid(
        label: "Ajustes",
        icon: Icons.settings_outlined,
        onTap: () {},
      ),
    ];

    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("UCInventory"),
            Text(
              "Áreas",
              style: AppTextStyle.getAppTextStyle(
                size: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              injector<DBDataSources>().getCSVDataBase();
            },
            icon: const Icon(Icons.search_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              context.router.push(const ScanRoute());
            },
            icon: const Icon(Icons.qr_code_scanner_outlined),
          ),
          IconButton(
            color: Colors.white,
            onPressed: () {
              context.router.push(const GenerateQRRoute());
            },
            icon: const Icon(Icons.qr_code_2_outlined),
          )
        ],
      ),
      //Verificar si existe la base de datos y mostrar la info segun corresponda
      //Importar base de datos
      body: const ImportDataBaseWidget(),
      // Lista de areas
      // body: const ViewListArea(),
    );
  }
}

class ViewListArea extends StatelessWidget {
  const ViewListArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ItemList(
          index: index,
        );
      },
    );
  }
}

class ImportDataBaseWidget extends StatelessWidget {
  const ImportDataBaseWidget({
    super.key,
    // required this.homeBloc,
  });

  // final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                      textAlign: TextAlign.justify,
                      style: AppTextStyle.getAppTextStyle(size: 20),
                      'Por favor, importe una base de datos para operar sobre ella o visualizar la información'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // homeBloc.add(OnChargedBD());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.import_export_outlined,
                      ),
                      SizedBox(width: 10),
                      Text('Importar BD'),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.index,
    this.onTap,
  }) : super(key: key);

  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.router.push(AreasDetailsRoute(title: "$index"));
        },
        title: Text('Esta es la prueba $index'),
        trailing: const Icon(CupertinoIcons.chevron_right),
      ),
    );
  }
}

class ItemGrid extends StatelessWidget {
  const ItemGrid({
    Key? key,
    required this.label,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                size: 120,
                color: AppColors.primaryColor,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

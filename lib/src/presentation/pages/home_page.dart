// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/dependencies.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:inventory_tesis/src/presentation/presentation.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector.call<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => injector.call<AreaBloc>(),
        ),
      ],
      child: Scaffold(
        drawer: const SideBar(),
        appBar: AppBar(
          title: const Text("Control de inventario"),
          actions: [
            // IconButton(
            //   color: Colors.white,
            //   onPressed: () {
            //     context.router.push(const TakeInventoryRoute());
            //   },
            //   icon: const Icon(Icons.inventory_2_outlined),
            // ),
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
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.primaryColor,
            label: const Row(children: [
              Icon(
                Icons.import_export,
                color: Colors.white,
              ),
              Text(
                'Importar Base de datos',
                style: TextStyle(color: Colors.white),
              )
            ]),
            onPressed: () {
              context.read<HomeBloc>().add(DataBaseImported());
            }),
        body: BlocBuilder<HomeBloc, BaseState<void>>(
          builder: (context, state) {
            if (state is BaseStateLoading) {
              return const CupertinoActivityIndicator();
            }
            if (state is BaseStateSuccess) {
              context.read<AreaBloc>().add(const AreasLoaded());
              return const ViewListArea();
            } else {
              return const Center(
                  child: Text('Aun no ha importado una Base de datos'));
            }
          },
        ),
      ),
    );
  }
}

class ViewListArea extends StatelessWidget {
  const ViewListArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreaBloc, BaseState<List<String?>>>(
      builder: (context, state) => state.when(
        initial: Container.new,
        loading: () => const CupertinoActivityIndicator(),
        error: (error) => Container(),
        empty: Container.new,
        success: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    context.router
                        .push(AreasDetailsRoute(area: data[index].toString()));
                  },
                  title: Text(data[index].toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}





// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/dependencies.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/src/common/theme/app_colors.dart';
import 'package:inventory_tesis/src/common/theme/app_text_styles.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/home/home_bloc.dart';
import 'package:inventory_tesis/src/presentation/components/sidebar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                context.router.push(const TakeInventoryRoute());
              },
              icon: const Icon(Icons.inventory_2_outlined),
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
        body: BlocBuilder<HomeBloc, BaseState<void>>(
          builder: (context, state) {
            if (state is BaseStateLoading) {
              return Center(
                child: PrimaryButton(
                  isLoading: true,
                  text: 'Importando',
                  onPresed: () {},
                ),
              );
            }
            if (state is BaseStateSuccess) {
              context.read<AreaBloc>().add(const AreasLoaded());
              return const ViewListArea();
            } else {
              return Center(
                child: PrimaryButton(
                  text: 'Importar base de datos',
                  onPresed: () {
                    context.read<HomeBloc>().add(DataBaseImported());
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.isLoading = false,
    required this.text,
    this.textLoading,
    this.onPresed,
  });

  final String text;
  final String? textLoading;
  final bool? isLoading;
  final Function()? onPresed;

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? ElevatedButton(
            onPressed: onPresed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.import_export),
                const SizedBox(width: 10),
                Text(text),
              ],
            ))
        : ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CupertinoActivityIndicator(),
                const SizedBox(width: 10),
                Text(text),
              ],
            ));
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
                          context.router.push(
                              AreasDetailsRoute(area: data[index].toString()));
                        },
                        title: Text(data[index].toString()),
                      ),
                    ),
                  );
                },
              ),
            ));
  }
}

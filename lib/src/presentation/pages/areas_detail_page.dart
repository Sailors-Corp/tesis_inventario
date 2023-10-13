import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/dependencies.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_detail_bloc.dart';

@RoutePage()
class AreasDetailsPage extends StatelessWidget {
  const AreasDetailsPage({super.key, required this.area});

  final String area;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          injector.call<AreaDetailBloc>()..add(AreaDetailLoaded(area)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(area),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.cloud_download))
          ],
        ),
        body: BlocBuilder<AreaDetailBloc, BaseState<List<MedioEntity>>>(
            builder: (context, state) => state.when(
                  initial: Container.new,
                  loading: () => const CupertinoActivityIndicator(),
                  error: (error) {
                    return Center(
                      child: Text(error),
                    );
                  },
                  empty: Container.new,
                  success: (data) => ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ListTile(
                          title: Text(data[index].subclassification),
                          trailing: Text(data[index].cant.toString()),
                        ),
                      );
                    },
                  ),
                )),
      ),
    );
  }
}

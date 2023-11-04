// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/core/utils/base_state.dart';
import 'package:inventory_tesis/src/dependencies.dart';
import 'package:inventory_tesis/src/domain/entities/medio_entity.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_detail_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/report_bloc/report_bloc.dart';

@RoutePage()
class AreasDetailsPage extends StatelessWidget {
  AreasDetailsPage({
    Key? key,
    required this.area,
  }) : super(key: key);

  final String area;
  late List<MedioEntity>? listData = [];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              injector.call<AreaDetailBloc>()..add(AreaDetailLoaded(area)),
        ),
        BlocProvider(
          create: (context) => injector.call<ReportBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(area),
          actions: [
            BlocConsumer<AreaDetailBloc, BaseState<List<MedioEntity>>>(
              listener: (context, state) {
                listData = <MedioEntity>[];
                state.when(
                  initial: () {},
                  loading: () {},
                  error: (error) {},
                  empty: () {},
                  success: (data) {
                    listData = data;
                  },
                );
              },
              builder: (context, state) {
                return BlocConsumer<ReportBloc, BaseState<void>>(
                  listener: (context, state) {
                    if (state is BaseStateError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context
                            .read<ReportBloc>()
                            .add(ReportExported(data: listData!, area: area));
                      },
                      icon: const Icon(CupertinoIcons.cloud_download),
                    );
                  },
                );
              },
            )
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

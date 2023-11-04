import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:inventory_tesis/src/app.dart';
import 'package:inventory_tesis/src/dependencies.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:inventory_tesis/src/presentation/movement/movement_bloc.dart';
import 'package:inventory_tesis/src/presentation/services/bloc_observer/bloc_observer.dart';

import 'src/presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);
  await initializeDependencies();

  Bloc.observer = injector<SimpleBlocObserver>();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => injector.call<AreaBloc>(),
      ),
      BlocProvider(
        create: (context) => injector.call<HomeBloc>(),
      ),
      BlocProvider(
        create: ((context) => injector.call<AuthBloc>()),
      ),
      BlocProvider(
        create: ((context) => injector.call<GenerateQRBloc>()),
      ),
      BlocProvider(
        create: ((context) => injector.call<MovementBloc>()),
      ),
    ],
    child: MyApp(),
  ));
}

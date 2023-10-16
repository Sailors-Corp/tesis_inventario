import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_tesis/src/data/data.dart';
import 'package:inventory_tesis/src/data/datasources/db_datasource.dart';
import 'package:inventory_tesis/src/data/db/dao/medio_dao.dart';
import 'package:inventory_tesis/src/data/db/dao/movement_dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/repositories/db_repository_impl.dart';
import 'package:inventory_tesis/src/data/repositories/scan_repository_impl.dart';
import 'package:inventory_tesis/src/domain/repositories/app_repo.dart';
import 'package:inventory_tesis/src/domain/repositories/auth_repository.dart';
import 'package:inventory_tesis/src/domain/repositories/db_repository.dart';
import 'package:inventory_tesis/src/domain/repositories/generate_qr_repository.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_detail_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/report_bloc/report_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/medio_form/movement_form_bloc.dart';
import 'package:inventory_tesis/src/presentation/blocs/scan/scan_cubit.dart';
import 'package:inventory_tesis/src/presentation/services/domain/pdf_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/presentation/presentation.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await registerStorageDirectory();

  //SharedPreferences

  final SharedPreferences preferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => preferences);

  //Database

  injector.registerLazySingleton<AppDatabase>(
    () => AppDatabase(),
  );

//Daos

  injector
    ..registerFactory(
      () => MedioBasicoDao(
        injector<AppDatabase>(),
      ),
    )
    ..registerFactory<MovementDao>(
      () => MovementDao(
        injector<AppDatabase>(),
      ),
    );

  // Register DataSources

  injector
    ..registerLazySingleton<AuthDataSources>(
      () => AuthDataSourcesImpl(),
    )
    ..registerLazySingleton<DataBaseDataSources>(
      () => DataBaseDataSourcesImpl(
        injector<MedioBasicoDao>(),
        injector<MovementDao>(),
      ),
    );

  // Register Repositories
  injector
    ..registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(
        injector<SharedPreferences>(),
      ),
    )
    ..registerLazySingleton<DataBaseRepository>(
      () => DataBaseRepositoryImpl(
        injector<DataBaseDataSources>(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        injector<AuthDataSources>(),
      ),
    )
    ..registerLazySingleton<ScanRepository>(
      () => ScanRepositoryImpl(
        injector<MedioBasicoDao>(),
      ),
    )
    ..registerLazySingleton<PDFRepository>(() => PDFRepository())
    ..registerLazySingleton<GenerateQRRepository>(
      () => GenerateQRRepositoryImpl(),
    );

  //Register Blocs

  injector
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        injector<AuthRepository>(),
        injector<AppRepository>(),
      ),
    )
    ..registerFactory<AreaBloc>(
      () => AreaBloc(
        injector<DataBaseRepository>(),
      ),
    )
    ..registerFactory<AreaDetailBloc>(
      () => AreaDetailBloc(
        injector<DataBaseRepository>(),
      ),
    )
    ..registerLazySingleton<AppCubit>(
      () => AppCubit(
        injector<AppRepository>(),
      ),
    )
    ..registerFactory<ScanCubit>(
      () => ScanCubit(
        injector<ScanRepository>(),
      ),
    )
    ..registerFactory<MovementFormBloc>(
      () => MovementFormBloc(
        injector<DataBaseRepository>(),
      ),
    )
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(
        injector<DataBaseDataSources>(),
      ),
    )
    ..registerFactory<ReportBloc>(
      () => ReportBloc(injector<PDFRepository>()),
    )
    ..registerLazySingleton<GenerateQRBloc>(
      () => GenerateQRBloc(
        injector<GenerateQRRepository>(),
      ),
    );
}

Future<void> registerStorageDirectory() async {
  if (kIsWeb) {
    final webStorageDirectory = Directory('');
    injector.registerLazySingleton(() => webStorageDirectory);
  } else if (Platform.isAndroid) {
    final Directory? dir = await getExternalStorageDirectory();
    if (dir != null) {
      injector.registerLazySingleton(() => dir);
    }
  } else if (Platform.isIOS) {
    final Directory dir = await getApplicationDocumentsDirectory();
    injector.registerLazySingleton(() => dir);
  }
}

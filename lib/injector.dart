import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_tesis/features/data/data.dart';
import 'package:inventory_tesis/features/data/datasources/db_datasource.dart';
import 'package:inventory_tesis/features/data/db/dao/dao.dart';
import 'package:inventory_tesis/features/data/db/database.dart';
import 'package:inventory_tesis/features/domain/repositories/app_repo.dart';
import 'package:inventory_tesis/features/domain/repositories/auth_repository.dart';
import 'package:inventory_tesis/features/domain/repositories/generate_qr_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/presentation/presentation.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  await registerStorageDirectory();

  //SharedPreferences
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => preferences);

  // final packageInfo = await PackageInfo.fromPlatform();
  // injector.registerLazySingleton(() => packageInfo);

  // injector.registerLazySingleton<PackageInfoService>(
  // () => PackageInfoServiceImpl(
  // injector(),
  // ),
  // );

  // injector.registerLazySingleton<LoggerService>(() => LoggerServiceImpl());

  // Rest Client
  // injector.registerLazySingleton<Dio>(() => Dio());
  // injector.registerLazySingleton<RestApiClient>(() => RestApiClient(
  //       injector(),
  //     ));

  //Database
  injector.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // injector.registerLazySingleton<IsarServices>(() => IsarServices());

  injector.registerFactory(() => MedioDao(
        injector<AppDatabase>(),
      ));

  // Register DataSources
  injector.registerLazySingleton<AuthDataSources>(
    () => AuthDataSourcesImpl(),
  );
  injector.registerLazySingleton<GenerateQRDataSources>(
    () => GenerateQRDataSourcesImpl(),
  );

  injector.registerLazySingleton<DBDataSources>(
      () => DBDataSourcesImpl(injector()));

  // Register Repositories
  injector.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      injector(),
    ),
  );
  injector.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(injector()),
  );
  injector.registerLazySingleton<GenerateQRRepository>(
    () => GenerateQRRepositoryImpl(injector()),
  );

  //Register Blocs

  injector.registerFactory<AuthBloc>(
    () => AuthBloc(
      injector(),
      injector(),
    ),
  );

  injector.registerFactory<AppCubit>(
    () => AppCubit(
      injector(),
    ),
  );

  injector.registerFactory<HomeBloc>(
    () => HomeBloc(),
  );

  injector.registerFactory<GenerateQRBloc>(
    () => GenerateQRBloc(
      injector(),
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

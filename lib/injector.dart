import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_tesis/src/data/data.dart';
import 'package:inventory_tesis/src/data/datasources/db_datasource.dart';
import 'package:inventory_tesis/src/data/db/dao/dao.dart';
import 'package:inventory_tesis/src/data/db/database.dart';
import 'package:inventory_tesis/src/data/repositories/scan_repository_impl.dart';
import 'package:inventory_tesis/src/domain/repositories/app_repo.dart';
import 'package:inventory_tesis/src/domain/repositories/auth_repository.dart';
import 'package:inventory_tesis/src/domain/repositories/generate_qr_repository.dart';
import 'package:inventory_tesis/src/domain/repositories/scan_repositoy.dart';
import 'package:inventory_tesis/src/presentation/blocs/scan/scan_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/presentation/presentation.dart';

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

  injector.registerFactory(() => MBDao(
        injector<AppDatabase>(),
      ));

  // Register DataSources

  injector
    ..registerLazySingleton<AuthDataSources>(
      () => AuthDataSourcesImpl(),
    )
    ..registerLazySingleton<DBDataSources>(
        () => DBDataSourcesImpl(injector<MBDao>()));

  // Register Repositories
  injector
    ..registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(
        injector<SharedPreferences>(),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(injector<AuthDataSources>()),
    )
    ..registerLazySingleton<ScanRepository>(
      () => ScanRepositoryImpl(injector<MBDao>()),
    )
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
    ..registerLazySingleton<AppCubit>(
      () => AppCubit(
        injector<AppRepository>(),
      ),
    )
    ..registerLazySingleton<ScanCubit>(
      () => ScanCubit(
        injector<ScanRepository>(),
      ),
    )
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(),
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

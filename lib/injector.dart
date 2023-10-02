import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_tesis/features/auth/data/datasources/auth_data_sources.dart';
import 'package:inventory_tesis/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:inventory_tesis/features/auth/domain/repositories/auth_repository.dart';
import 'package:inventory_tesis/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:inventory_tesis/features/shared/data/repositories/app_repository_impl.dart';
import 'package:inventory_tesis/features/shared/domain/repositories/app_repo.dart';
import 'package:inventory_tesis/features/shared/presentation/blocs/home/home_bloc.dart';
import 'package:inventory_tesis/features/shared/presentation/blocs/manager/app_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  // injector.registerLazySingleton<AppDatabase>(() => AppDatabase());
  // injector.registerLazySingleton<IsarServices>(() => IsarServices());

  // Register DataSources
  injector.registerLazySingleton<AuthDataSources>(
    () => AuthDataSourcesImpl(),
  );

  // Register Repositories
  injector.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      injector(),
    ),
  );
  injector.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(injector()),
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

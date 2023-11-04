import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_tesis/src/dependencies.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';
import 'package:inventory_tesis/src/services/on_boarding/data/on_boarding_repository_impl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart' as sizer;

import 'common/routes/app_routes.dart';
import 'common/theme/app_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  final onBoardingRepository =
      OnBoardingRepositoryImpl(injector<SharedPreferences>());

  late String? token = '';

  Future getInfo() async {
    token = await onBoardingRepository.getInfo();
    log(token.toString());
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return sizer.Sizer(builder: (
      BuildContext context,
      Orientation orientation,
      sizer.DeviceType deviceType,
    ) {
      return OKToast(
          child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(
          initialRoutes: [
            if (token != null) const HomeRoute() else const OnBoardingRoute(),
          ],
        ),
        debugShowCheckedModeBanner: false,
        title: 'Control de inventario',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: AppColors.primaryColor,
          ),
        ),
      ));
    });
  }
}

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.dart';
import 'package:inventory_tesis/dependencies.dart';
import 'package:inventory_tesis/src/presentation/blocs/area/area_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sizer/sizer.dart' as sizer;

import 'src/presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return sizer.Sizer(builder: (
      BuildContext context,
      Orientation orientation,
      sizer.DeviceType deviceType,
    ) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => injector.call<AreaBloc>(),
          ),
          BlocProvider(
            create: (context) => injector.call<AppCubit>(),
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
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, appState) {
            return DevicePreview(
              enabled: false,
              builder: (context) => OKToast(
                  child: MaterialApp.router(
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: _appRouter.delegate(),
                debugShowCheckedModeBanner: false,
                title: 'UCInventory',
                theme: appState.themeData,
                // supportedLocales: S.delegate.supportedLocales,
                // localizationsDelegates: const [
                // S.delegate,
                // GlobalMaterialLocalizations.delegate,
                // GlobalCupertinoLocalizations.delegate,
                // Built-in localization for text direction LTR/RTL
                // GlobalWidgetsLocalizations.delegate,
                // ],
                // locale: appState.locale,
              )),
            );
          },
        ),
      );
    });
  }
}

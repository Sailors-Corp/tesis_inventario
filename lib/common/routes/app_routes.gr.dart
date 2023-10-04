// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:inventory_tesis/features/auth/presentation/pages/auth_page.dart'
    as _i1;
<<<<<<< HEAD
import 'package:inventory_tesis/features/generateQR/presentation/pages/generateQR_page.dart'
    as _i2;
import 'package:inventory_tesis/features/home/presentation/pages/home_page.dart'
=======
import 'package:inventory_tesis/features/shared/presentation/pages/home_page.dart'
    as _i2;
import 'package:inventory_tesis/features/scan/presentation/pages/scan_page.dart'
>>>>>>> develop
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    GenerateQRRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GenerateQRPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ScanRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ScanPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i4.PageRouteInfo<void> {
  const AuthRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
<<<<<<< HEAD
}

/// generated route for
/// [_i2.GenerateQRPage]
class GenerateQRRoute extends _i4.PageRouteInfo<void> {
  const GenerateQRRoute({List<_i4.PageRouteInfo>? children})
      : super(
          GenerateQRRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenerateQRRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
=======
}

/// generated route for
/// [_i2.HomePage]
>>>>>>> develop
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
<<<<<<< HEAD
=======
}

/// generated route for
/// [_i3.ScanPage]
class ScanRoute extends _i4.PageRouteInfo<void> {
  const ScanRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
>>>>>>> develop
}

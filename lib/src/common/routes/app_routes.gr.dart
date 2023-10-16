// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i8;
import 'package:inventory_tesis/src/presentation/pages/areas_detail_page.dart'
    as _i1;
import 'package:inventory_tesis/src/presentation/pages/auth_page.dart' as _i2;
import 'package:inventory_tesis/src/presentation/pages/generateQR_page.dart'
    as _i3;
import 'package:inventory_tesis/src/presentation/pages/home_page.dart' as _i4;
import 'package:inventory_tesis/src/presentation/pages/scan_page.dart' as _i6;
import 'package:inventory_tesis/src/presentation/pages/views/movement_form_view.dart'
    as _i5;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AreasDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AreasDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AreasDetailsPage(
          key: args.key,
          area: args.area,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    GenerateQRRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GenerateQRPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    MovementRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MovementPage(),
      );
    },
    ScanRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ScanPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AreasDetailsPage]
class AreasDetailsRoute extends _i7.PageRouteInfo<AreasDetailsRouteArgs> {
  AreasDetailsRoute({
    _i8.Key? key,
    required String area,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AreasDetailsRoute.name,
          args: AreasDetailsRouteArgs(
            key: key,
            area: area,
          ),
          initialChildren: children,
        );

  static const String name = 'AreasDetailsRoute';

  static const _i7.PageInfo<AreasDetailsRouteArgs> page =
      _i7.PageInfo<AreasDetailsRouteArgs>(name);
}

class AreasDetailsRouteArgs {
  const AreasDetailsRouteArgs({
    this.key,
    required this.area,
  });

  final _i8.Key? key;

  final String area;

  @override
  String toString() {
    return 'AreasDetailsRouteArgs{key: $key, area: $area}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GenerateQRPage]
class GenerateQRRoute extends _i7.PageRouteInfo<void> {
  const GenerateQRRoute({List<_i7.PageRouteInfo>? children})
      : super(
          GenerateQRRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenerateQRRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MovementPage]
class MovementRoute extends _i7.PageRouteInfo<void> {
  const MovementRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MovementRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovementRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ScanPage]
class ScanRoute extends _i7.PageRouteInfo<void> {
  const ScanRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
<<<<<<< HEAD
import 'package:flutter/material.dart' as _i6;
import 'package:inventory_tesis/features/auth/presentation/pages/auth_page.dart'
    as _i2;
import 'package:inventory_tesis/features/scan/presentation/pages/scan_page.dart'
    as _i4;
import 'package:inventory_tesis/features/shared/presentation/pages/areas_detail_page.dart'
    as _i1;
import 'package:inventory_tesis/features/shared/presentation/pages/home_page.dart'
=======
import 'package:inventory_tesis/features/presentation/pages/auth_page.dart'
    as _i1;
import 'package:inventory_tesis/features/presentation/pages/generateQR_page.dart'
    as _i2;
import 'package:inventory_tesis/features/presentation/pages/home_page.dart'
>>>>>>> develop
    as _i3;
import 'package:inventory_tesis/features/presentation/pages/scan_page.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
<<<<<<< HEAD
    AreasDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AreasDetailsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AreasDetailsPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
=======
>>>>>>> develop
    AuthRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    GenerateQRRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.GenerateQRPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ScanRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ScanPage(),
      );
    },
  };
}

/// generated route for
<<<<<<< HEAD
/// [_i1.AreasDetailsPage]
class AreasDetailsRoute extends _i5.PageRouteInfo<AreasDetailsRouteArgs> {
  AreasDetailsRoute({
    _i6.Key? key,
    required String title,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AreasDetailsRoute.name,
          args: AreasDetailsRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AreasDetailsRoute';

  static const _i5.PageInfo<AreasDetailsRouteArgs> page =
      _i5.PageInfo<AreasDetailsRouteArgs>(name);
}

class AreasDetailsRouteArgs {
  const AreasDetailsRouteArgs({
    this.key,
    required this.title,
  });

  final _i6.Key? key;

  final String title;

  @override
  String toString() {
    return 'AreasDetailsRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i2.AuthPage]
=======
/// [_i1.AuthPage]
>>>>>>> develop
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
<<<<<<< HEAD
=======
}

/// generated route for
/// [_i2.GenerateQRPage]
class GenerateQRRoute extends _i5.PageRouteInfo<void> {
  const GenerateQRRoute({List<_i5.PageRouteInfo>? children})
      : super(
          GenerateQRRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenerateQRRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
>>>>>>> develop
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ScanPage]
class ScanRoute extends _i5.PageRouteInfo<void> {
  const ScanRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

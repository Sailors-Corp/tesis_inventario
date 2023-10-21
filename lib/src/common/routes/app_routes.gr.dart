// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/cupertino.dart' as _i12;
import 'package:inventory_tesis/src/presentation/pages/areas_detail_page.dart'
    as _i1;
import 'package:inventory_tesis/src/presentation/pages/auth_page.dart' as _i2;
import 'package:inventory_tesis/src/presentation/pages/generateQR_page.dart'
    as _i3;
import 'package:inventory_tesis/src/presentation/pages/home_page.dart' as _i4;
import 'package:inventory_tesis/src/presentation/pages/movement_report_page.dart'
    as _i6;
import 'package:inventory_tesis/src/presentation/pages/reports_page.dart'
    as _i8;
import 'package:inventory_tesis/src/presentation/pages/scan_page.dart' as _i9;
import 'package:inventory_tesis/src/presentation/pages/takeInventory_page.dart'
    as _i10;
import 'package:inventory_tesis/src/presentation/pages/views/movement_form_view.dart'
    as _i5;
import 'package:inventory_tesis/src/presentation/services/on_boarding/presentation/on_boarding_page.dart'
    as _i7;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AreasDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AreasDetailsRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AreasDetailsPage(
          key: args.key,
          area: args.area,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    GenerateQRRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GenerateQRPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    MovementRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MovementPage(),
      );
    },
    MovementReportRoute.name: (routeData) {
      final args = routeData.argsAs<MovementReportRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MovementReportPage(
          key: args.key,
          typeReport: args.typeReport,
        ),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnBoardingPage(),
      );
    },
    ReportsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ReportsPage(),
      );
    },
    ScanRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ScanPage(),
      );
    },
    TakeInventoryRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TakeInventoryPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AreasDetailsPage]
class AreasDetailsRoute extends _i11.PageRouteInfo<AreasDetailsRouteArgs> {
  AreasDetailsRoute({
    _i12.Key? key,
    required String area,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AreasDetailsRoute.name,
          args: AreasDetailsRouteArgs(
            key: key,
            area: area,
          ),
          initialChildren: children,
        );

  static const String name = 'AreasDetailsRoute';

  static const _i11.PageInfo<AreasDetailsRouteArgs> page =
      _i11.PageInfo<AreasDetailsRouteArgs>(name);
}

class AreasDetailsRouteArgs {
  const AreasDetailsRouteArgs({
    this.key,
    required this.area,
  });

  final _i12.Key? key;

  final String area;

  @override
  String toString() {
    return 'AreasDetailsRouteArgs{key: $key, area: $area}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GenerateQRPage]
class GenerateQRRoute extends _i11.PageRouteInfo<void> {
  const GenerateQRRoute({List<_i11.PageRouteInfo>? children})
      : super(
          GenerateQRRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenerateQRRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MovementPage]
class MovementRoute extends _i11.PageRouteInfo<void> {
  const MovementRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MovementRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovementRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MovementReportPage]
class MovementReportRoute extends _i11.PageRouteInfo<MovementReportRouteArgs> {
  MovementReportRoute({
    _i12.Key? key,
    required String typeReport,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MovementReportRoute.name,
          args: MovementReportRouteArgs(
            key: key,
            typeReport: typeReport,
          ),
          initialChildren: children,
        );

  static const String name = 'MovementReportRoute';

  static const _i11.PageInfo<MovementReportRouteArgs> page =
      _i11.PageInfo<MovementReportRouteArgs>(name);
}

class MovementReportRouteArgs {
  const MovementReportRouteArgs({
    this.key,
    required this.typeReport,
  });

  final _i12.Key? key;

  final String typeReport;

  @override
  String toString() {
    return 'MovementReportRouteArgs{key: $key, typeReport: $typeReport}';
  }
}

/// generated route for
/// [_i7.OnBoardingPage]
class OnBoardingRoute extends _i11.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ReportsPage]
class ReportsRoute extends _i11.PageRouteInfo<void> {
  const ReportsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ScanPage]
class ScanRoute extends _i11.PageRouteInfo<void> {
  const ScanRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TakeInventoryPage]
class TakeInventoryRoute extends _i11.PageRouteInfo<void> {
  const TakeInventoryRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TakeInventoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TakeInventoryRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

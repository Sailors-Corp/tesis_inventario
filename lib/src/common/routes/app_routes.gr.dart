// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i13;
import 'package:inventory_tesis/src/presentation/pages/areas_detail_page.dart'
    as _i1;
import 'package:inventory_tesis/src/presentation/pages/auth_page.dart' as _i2;
import 'package:inventory_tesis/src/presentation/pages/generateQR_page.dart'
    as _i3;
import 'package:inventory_tesis/src/presentation/pages/home_page.dart' as _i4;
import 'package:inventory_tesis/src/presentation/pages/inventory_report_page.dart'
    as _i5;
import 'package:inventory_tesis/src/presentation/pages/movement_report_page.dart'
    as _i7;
import 'package:inventory_tesis/src/presentation/pages/reports_page.dart'
    as _i9;
import 'package:inventory_tesis/src/presentation/pages/scan_page.dart' as _i10;
import 'package:inventory_tesis/src/presentation/pages/takeInventory_page.dart'
    as _i11;
import 'package:inventory_tesis/src/presentation/pages/views/movement_form_view.dart'
    as _i6;
import 'package:inventory_tesis/src/services/on_boarding/presentation/on_boarding_page.dart'
    as _i8;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AreasDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AreasDetailsRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AreasDetailsPage(
          key: args.key,
          area: args.area,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    GenerateQRRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.GenerateQRPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    InventoryReportRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.InventoryReportPage(),
      );
    },
    MovementRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MovementPage(),
      );
    },
    MovementReportRoute.name: (routeData) {
      final args = routeData.argsAs<MovementReportRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MovementReportPage(
          key: args.key,
          typeReport: args.typeReport,
        ),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoardingPage(),
      );
    },
    ReportsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ReportsPage(),
      );
    },
    ScanRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ScanPage(),
      );
    },
    TakeInventoryRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TakeInventoryPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AreasDetailsPage]
class AreasDetailsRoute extends _i12.PageRouteInfo<AreasDetailsRouteArgs> {
  AreasDetailsRoute({
    _i13.Key? key,
    required String area,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AreasDetailsRoute.name,
          args: AreasDetailsRouteArgs(
            key: key,
            area: area,
          ),
          initialChildren: children,
        );

  static const String name = 'AreasDetailsRoute';

  static const _i12.PageInfo<AreasDetailsRouteArgs> page =
      _i12.PageInfo<AreasDetailsRouteArgs>(name);
}

class AreasDetailsRouteArgs {
  const AreasDetailsRouteArgs({
    this.key,
    required this.area,
  });

  final _i13.Key? key;

  final String area;

  @override
  String toString() {
    return 'AreasDetailsRouteArgs{key: $key, area: $area}';
  }
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GenerateQRPage]
class GenerateQRRoute extends _i12.PageRouteInfo<void> {
  const GenerateQRRoute({List<_i12.PageRouteInfo>? children})
      : super(
          GenerateQRRoute.name,
          initialChildren: children,
        );

  static const String name = 'GenerateQRRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InventoryReportPage]
class InventoryReportRoute extends _i12.PageRouteInfo<void> {
  const InventoryReportRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InventoryReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'InventoryReportRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MovementPage]
class MovementRoute extends _i12.PageRouteInfo<void> {
  const MovementRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MovementRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovementRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MovementReportPage]
class MovementReportRoute extends _i12.PageRouteInfo<MovementReportRouteArgs> {
  MovementReportRoute({
    _i13.Key? key,
    required String typeReport,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MovementReportRoute.name,
          args: MovementReportRouteArgs(
            key: key,
            typeReport: typeReport,
          ),
          initialChildren: children,
        );

  static const String name = 'MovementReportRoute';

  static const _i12.PageInfo<MovementReportRouteArgs> page =
      _i12.PageInfo<MovementReportRouteArgs>(name);
}

class MovementReportRouteArgs {
  const MovementReportRouteArgs({
    this.key,
    required this.typeReport,
  });

  final _i13.Key? key;

  final String typeReport;

  @override
  String toString() {
    return 'MovementReportRouteArgs{key: $key, typeReport: $typeReport}';
  }
}

/// generated route for
/// [_i8.OnBoardingPage]
class OnBoardingRoute extends _i12.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ReportsPage]
class ReportsRoute extends _i12.PageRouteInfo<void> {
  const ReportsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ScanPage]
class ScanRoute extends _i12.PageRouteInfo<void> {
  const ScanRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ScanRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TakeInventoryPage]
class TakeInventoryRoute extends _i12.PageRouteInfo<void> {
  const TakeInventoryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TakeInventoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TakeInventoryRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

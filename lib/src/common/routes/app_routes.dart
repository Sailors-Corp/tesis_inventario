import 'package:auto_route/auto_route.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnBoardingRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: ScanRoute.page,
        ),
        AutoRoute(
          page: GenerateQRRoute.page,
        ),
        AutoRoute(
          page: AreasDetailsRoute.page,
        ),
        AutoRoute(
          page: TakeInventoryRoute.page,
        ),
        AutoRoute(
          page: MovementRoute.page,
        ),
        AutoRoute(
          page: ReportsRoute.page,
        ),
        AutoRoute(
          page: MovementReportRoute.page,
        ),
        AutoRoute(
          page: InventoryReportRoute.page,
        ),
      ];
}

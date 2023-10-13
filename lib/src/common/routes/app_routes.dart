import 'package:auto_route/auto_route.dart';
import 'package:inventory_tesis/src/common/routes/app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
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
      ];
}

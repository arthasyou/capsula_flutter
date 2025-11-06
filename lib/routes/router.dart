import 'package:auto_route/auto_route.dart';
import '../pages/auth/sign_in_page.dart';
import '../pages/layouts/main_tab_layout.dart';
import '../pages/tabs/home_page.dart';
import '../pages/tabs/health_data_page.dart';
import '../pages/tabs/me_page.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignInRoute.page, path: '/sign-in'),
    AutoRoute(
      page: MainTabLayoutRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
        AutoRoute(page: HealthDataRoute.page, path: 'health-data'),
        AutoRoute(page: MeRoute.page, path: 'me'),
      ],
    ),
  ];
}

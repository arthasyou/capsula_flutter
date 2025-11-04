import 'package:auto_route/auto_route.dart';
import '../pages/app_page.dart';
import '../pages/sign_in_page.dart';
import '../pages/root_page.dart';
import '../pages/navigation/home_page.dart';
import '../pages/navigation/live_page.dart';
import '../pages/navigation/message_page.dart';
import '../pages/navigation/cart_page.dart';
import '../pages/navigation/me_page.dart';
part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AppRoute.page, initial: false),
    AutoRoute(page: SignInRoute.page, path: '/sign-in'),
    AutoRoute(
      page: RootRoute.page,
      path: '/root',
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page, path: 'Home'),
        AutoRoute(page: LiveRoute.page, path: 'Live'),
        AutoRoute(page: MessageRoute.page, path: 'Message'),
        AutoRoute(page: CartRoute.page, path: 'Cart'),
        AutoRoute(page: MeRoute.page, path: 'Me'),
      ],
    ),
  ];
}

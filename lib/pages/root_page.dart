import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../gen/app_localizations.dart';
import '../routes/router.dart';
import '../widgets/language_widget.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  // int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        LiveRoute(),
        MessageRoute(),
        CartRoute(),
        MeRoute(),
      ],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        String title;
        switch (tabsRouter.current.name) {
          case HomeRoute.name:
            title = localizations.home;
            break;
          case LiveRoute.name:
            title = localizations.live;
            break;
          case CartRoute.name:
            title = localizations.cart;
            break;
          case MessageRoute.name:
            title = localizations.message;
            break;
          case MeRoute.name:
            title = localizations.setting;
            break;
          default:
            title = localizations.app_name;
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            actions: const [LanguagePickerWidget(), SizedBox(width: 12)],
          ),
          body: child,
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home),
                label: localizations.home,
              ),
              NavigationDestination(
                icon: const Icon(Icons.living_rounded),
                label: localizations.live,
              ),
              NavigationDestination(
                icon: const Icon(Icons.message),
                label: localizations.message,
              ),
              NavigationDestination(
                icon: const Icon(Icons.card_travel),
                label: localizations.cart,
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings),
                label: localizations.setting,
              ),
            ],
            onDestinationSelected: (int index) {
              tabsRouter.setActiveIndex(index);
            },
            selectedIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}

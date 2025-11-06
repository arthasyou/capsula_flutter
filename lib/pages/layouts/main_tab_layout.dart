import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../gen/app_localizations.dart';
import '../../routes/router.dart';
import '../../widgets/language_widget.dart';

@RoutePage()
class MainTabLayoutPage extends StatelessWidget {
  const MainTabLayoutPage({super.key});

  // int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        HealthDataRoute(),
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
          case HealthDataRoute.name:
            title = localizations.health_data;
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
                icon: const Icon(Icons.favorite_border),
                label: localizations.health_data,
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

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:capsula_flutter/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'gen/app_localizations.dart';
import 'l10n.dart';
import 'providers/locale_provider.dart';
import 'routes/router.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  App({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      routerConfig: _appRouter.config(),
      locale: locale,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

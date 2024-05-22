import 'dart:io';

import 'package:ars_sonora/i18n/i18n.dart';
import 'package:ars_sonora/screens/home-page.dart';
import 'package:ars_sonora/screens/search-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  I18n.loadInstance(
    I18n([
      Translation(
          language: Language.en_US,
          fileContent: await rootBundle
              .loadString('assets/i18n/locales/en_US/layout.json'))
    ], defaultLanguage: Language.en_US),
  );
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
              path: 'search',
              builder: (BuildContext context, GoRouterState state) {
                return const SearchPage();
              })
        ]),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

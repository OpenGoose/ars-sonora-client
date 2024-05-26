import 'package:ars_sonora/screens/core/auth/not-authenticated.page.dart';
import 'package:ars_sonora/widgets/core/auth/auth-component-middleware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:ars_sonora/screens/home-page.dart';
import 'package:ars_sonora/screens/search-page.dart';

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

class Base extends HookWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthComponentMiddleware(
        authenticated: MaterialApp.router(
          routerConfig: _router,
        ),
        notAuthenticated: const MaterialApp(
          home: Scaffold(
            body: NotAuthenticatedPage(),
          ),
        ));
  }
}

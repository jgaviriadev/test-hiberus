
// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/card_page.dart';
import '../../features/home/presentation/pages/cards_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';


class AppRouter {
  AppRouter._();

  static final GoRouter routes = GoRouter(
    initialLocation: "/splash",
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        name: SplashPage.routeName,
        path: "/${SplashPage.routeName}",
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      // --- home section --- //
      GoRoute(
        name: HomePage.routeName,
        path: "/${HomePage.routeName}",
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            name: CardsPage.routeName,
            path: CardsPage.routeName,
            builder: (BuildContext context, GoRouterState state) {
              return const CardsPage();
            },
            routes: [
              GoRoute(
                name: CardPage.routeName,
                path: CardPage.routeName,
                builder: (BuildContext context, GoRouterState state) {
                  return const CardPage();
                },
              ),
            ]
          ),
        ]
      )
    ],
  );
}


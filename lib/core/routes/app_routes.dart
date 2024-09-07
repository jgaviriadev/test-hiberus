import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/domain/entities/card_entity.dart';
import '../../features/home/presentation/pages/card_page.dart';
import '../../features/home/presentation/pages/cards_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';


class AppRouter {
  AppRouter._();

  static final GoRouter routes = GoRouter(
    initialLocation: "/splash",
    navigatorKey: Get.key,
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
              final cards = state.extra as List<CardEntity>;
              return CardsPage(
                cards: cards
              );
            },
            routes: [
              GoRoute(
                name: CardPage.routeName,
                path: CardPage.routeName,
                builder: (BuildContext context, GoRouterState state) {
                  final card = state.extra as CardEntity;
                  return CardPage(
                    card: card,
                  );
                },
              ),
            ]
          ),
        ]
      )
    ],
  );
}


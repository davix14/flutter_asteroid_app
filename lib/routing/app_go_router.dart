import 'package:asteroid_test_app/features/ImageOfTheDay/widgets/fullscreen_image_widget.dart';
import 'package:asteroid_test_app/features/NearEarthAsteroids/models/nea_model.dart';
import 'package:asteroid_test_app/features/NearEarthAsteroids/widgets/neo_search_widget.dart';
import 'package:asteroid_test_app/routing/navBar/scaffold_with_nav_bar.dart';
import 'package:asteroid_test_app/routing/routes.dart';
import 'package:asteroid_test_app/single_asteroid_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home_screen.dart';
import '../util/transitions.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>();
final _shellNavigatorBKey = GlobalKey<NavigatorState>();
final _shellNavigatorCKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home.path,
  routes: [
    StatefulShellRoute.indexedStack(
      restorationScopeId: 'appShell',
      pageBuilder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return MaterialPage<void>(
              restorationId: 'appShellPage',
              child: ScaffoldWithNavBar(navigationShell: navigationShell),
            );
          },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // Home Route
            GoRoute(
              name: AppRoutes.home.name,
              path: AppRoutes.home.path,
              builder: (context, state) => HomeScreen(),
              routes: [
                GoRoute(
                  name: AppRoutes.fullscreenImageOfTheDay.name,
                  path: AppRoutes.fullscreenImageOfTheDay.path,
                  pageBuilder: (context, state) {
                    final data = state.extra! as Map<String, dynamic>;
                    return makeSlideTransitionPage(
                      key: state.pageKey,
                      child: FullscreenImageWidget(
                        title: data['title'],
                        explanation: data['explanation'],
                        imgBytes: data['imgBytes'],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // NEO Search
            GoRoute(
              name: AppRoutes.neoSearch.name,
              path: AppRoutes.neoSearch.path,
              builder: (context, state) => NEOSearchWidget(),
              routes: [
                GoRoute(
                  name: AppRoutes.singleAsteroid.name,
                  path: AppRoutes.singleAsteroid.path,
                  pageBuilder: (context, state) => makeSlideTransitionPage(
                    key: state.pageKey,
                    child: SingleAsteroidScreen(state.extra as SingleAsteroid),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

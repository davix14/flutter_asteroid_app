import 'package:asteroid_test_app/features/ImageOfTheDay/widgets/fullscreen_image_widget.dart';
import 'package:asteroid_test_app/features/NearEarthAsteroids/models/nea_model.dart';
import 'package:asteroid_test_app/routing/routes.dart';
import 'package:asteroid_test_app/single_asteroid_screen.dart';
import 'package:go_router/go_router.dart';

import '../home_screen.dart';
import '../util/transitions.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: AppRoutes.home.path,
  routes: [
    GoRoute(
      name: AppRoutes.home.name,
      path: AppRoutes.home.path,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: AppRoutes.singleAsteroid.name,
      path: AppRoutes.singleAsteroid.path,
      pageBuilder: (context, state) => makeSlideTransitionPage(
        key: state.pageKey,
        child: SingleAsteroidScreen(state.extra as SingleAsteroid),
      ),
    ),
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
);

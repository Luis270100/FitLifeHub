import 'package:common/presentation/views/home/home_view.dart';
import 'package:exercise/exercise.dart';
import 'package:fit_life_hub/router/shell_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile/presentation/views/profile/profile_view.dart';
import 'package:recipe/presentation/views/home/recipes_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _sectionNavigationKey =
    GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/exercises',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ShellWrapper(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: ExercisesView.route,
              path: ExercisesView.route,
              builder: (context, state) => const ExercisesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: RecipesView.route,
              path: RecipesView.route,
              builder: (context, state) => const RecipesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: ProfileView.route,
              path: ProfileView.route,
              builder: (context, state) => const ProfileView(),
            ),
          ],
        ),
      ],
    ),
  ],
);

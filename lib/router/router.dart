import 'package:auth/presentation/login/login_view.dart';
import 'package:auth/presentation/sing_in/sing_in_view.dart';
import 'package:exercise/domain/entities/exercise.dart';
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
  initialLocation: LoginView.route,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: LoginView.route,
      name: LoginView.route,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: SingInView.route,
      name: SingInView.route,
      builder: (context, state) => const SingInView(),
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
            GoRoute(
              name: ExerciseView.route,
              path: ExerciseView.route,
              builder: (context, state) {
                final exercise = state.extra as Exercise? ?? const Exercise();

                return ExerciseView(
                  exercise: exercise,
                );
              },
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

import 'package:common/presentation/views/home/home_view.dart';
import 'package:exercise/exercise.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/exercises',
  routes: [
    GoRoute(
      name: HomeView.route,
      path: HomeView.route,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      name: ExercisesView.route,
      path: ExercisesView.route,
      builder: (context, state) => const ExercisesView(),
    ),
  ],
);

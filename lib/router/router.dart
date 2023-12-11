import 'package:common/presentation/views/home/home_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeView.routeName,
      path: HomeView.routeName,
      builder: (context, state) => const HomeView(),
    ),
  ],
);

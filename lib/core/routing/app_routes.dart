import 'package:go_router/go_router.dart';
import 'package:pet_finder_app_task/features/splash/presentation/views/splash_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
  ],
);

import 'package:go_router/go_router.dart';
import 'package:pet_finder_app_task/features/home/presentation/views/home_view.dart';
import 'package:pet_finder_app_task/features/home/presentation/views/main_home_view.dart';
import 'package:pet_finder_app_task/features/home/presentation/views/pet_details_view.dart';
import 'package:pet_finder_app_task/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:pet_finder_app_task/features/splash/presentation/views/splash_view.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: OnBoardingView.routeName,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: MainHomeView.routeName,
      builder: (context, state) => const MainHomeView(),
    ),
    GoRoute(
      path: HomeView.routeName,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: PetDetailsView.routeName,
      builder: (context, state) => const PetDetailsView(),
    ),
  ],
);

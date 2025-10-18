import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app_task/core/widgets/custom_nav_bar.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/views/favourites_view.dart';
import 'package:pet_finder_app_task/features/home/presentation/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:pet_finder_app_task/features/home/presentation/views/home_view.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});
  static const routeName = '/main_home_view';

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  final List<Widget> views = const [
    HomeView(),
    FavouritesView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavBarCubit>(
      create: (context) => NavBarCubit(),
      child: BlocConsumer<NavBarCubit, NavBarState>(
        listener: (context, state) {
          if (state is NavBarIndexChanged) {}
        },
        builder: (context, state) {
          return Scaffold(
            body: views[context.read<NavBarCubit>().currentIndex],
            bottomNavigationBar: const CustomNavBar(),
          );
        },
      ),
    );
  }
}

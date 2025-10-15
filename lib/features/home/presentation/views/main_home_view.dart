import 'package:flutter/material.dart';
import 'package:pet_finder_app_task/core/widgets/custom_nav_bar.dart';
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[0],
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

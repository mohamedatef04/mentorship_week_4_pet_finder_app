import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/routing/app_routes.dart';
import 'package:pet_finder_app_task/core/services/get_it_service.dart';
import 'package:pet_finder_app_task/core/services/my_bloc_observer.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();
  Bloc.observer = MyBlocObserver();
  runApp(const PetFinderApp());
}

class PetFinderApp extends StatelessWidget {
  const PetFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whiteColor,
        ),
      ),
    );
  }
}

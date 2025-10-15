import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/widgets/favs_grid_view.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/categories_list_view.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});
  static const routeName = '/favourites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              SliverToBoxAdapter(
                child: Text(
                  'Your Favorite Pets',
                  style: AppTextStyles.black24,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 15.h)),
              const SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
              const FavsGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

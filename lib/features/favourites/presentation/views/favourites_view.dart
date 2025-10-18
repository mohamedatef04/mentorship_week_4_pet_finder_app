import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pet_finder_app_task/core/functions/show_snak_bar.dart';
import 'package:pet_finder_app_task/core/services/get_it_service.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/get_favourites_pets_use_case.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/remove_from_favourites_use_case.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/cubits/get_fav_pets/get_fav_pets_cubit.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/cubits/remove_from_favs/remove_from_favs_cubit.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/widgets/favs_grid_view.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/categories_list_view.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});
  static const routeName = '/favourites';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetFavPetsCubit(getIt.get<GetFavouritesPetsUseCase>())
                ..getFavPets(),
        ),
        BlocProvider(
          create: (context) =>
              RemoveFromFavsCubit(getIt.get<RemoveFromFavouritesUseCase>()),
        ),
      ],
      child: BlocConsumer<RemoveFromFavsCubit, RemoveFromFavsState>(
        listener: (context, state) {
          if (state is RemoveFromFavsSuccessState) {
            showSnakBar(context, message: 'Pet removed from favourites');
            context.read<GetFavPetsCubit>().getFavPets();
          } else if (state is RemoveFromFavsErrorState) {
            showSnakBar(context, message: state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is RemoveFromFavsLoadingState,
            child: Scaffold(
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
                      SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                      const FavsGridView(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

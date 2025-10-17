import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app_task/core/functions/show_snak_bar.dart';
import 'package:pet_finder_app_task/core/services/get_it_service.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/add_pet_to_fav_use_case.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/cubits/add_pet_to_fav_cubit/add_pet_to_fav_cubit_cubit.dart';
import 'package:pet_finder_app_task/features/home/domain/use_cases/get_all_pets_use_case.dart';
import 'package:pet_finder_app_task/features/home/domain/use_cases/get_serched_pets_use_case.dart';
import 'package:pet_finder_app_task/features/home/presentation/cubits/get_all_pets_cubit/get_all_pets_cubit.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/categories_list_view.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/header_text_and_icon_widget.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pets_list_view.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/search_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllPetsCubit>(
          create: (context) => GetAllPetsCubit(
            getIt.get<GetAllPetsUseCase>(),
            getIt.get<GetSerchedPetsUseCase>(),
          )..getAllPets(),
        ),
        BlocProvider(
          create: (context) =>
              AddPetToFavCubitCubit(getIt.get<AddPetToFavUseCase>()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return BlocConsumer<AddPetToFavCubitCubit, AddPetToFavCubitState>(
            listener: (context, state) {
              if (state is AddPetToFavCubitSuccessState) {
                showSnakBar(context, message: 'Pet added to favourites');
              } else if (state is AddPetToFavCubitErrorState) {
                showSnakBar(context, message: state.errorMessage);
              }
            },
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                          SliverToBoxAdapter(
                            child: Column(
                              spacing: 20,
                              children: [
                                const HeaderTextAndIconWidget(),
                                SearchWidget(
                                  prefixIcon: Transform.scale(
                                    scale: 0.5,
                                    child: SvgPicture.asset(
                                      Assets.imagesSearchNormal,
                                    ),
                                  ),
                                  hintText: 'Search',
                                  suffixIcon: Transform.scale(
                                    scale: 0.5,
                                    child: SvgPicture.asset(
                                      Assets.imagesSetting,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    context
                                        .read<GetAllPetsCubit>()
                                        .getSearchedPets(
                                          value,
                                        );
                                  },
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Categories',
                                    textAlign: TextAlign.start,
                                    style: AppTextStyles.black20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                          const SliverToBoxAdapter(
                            child: CategoriesListView(),
                          ),
                          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                          const PetsListView(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

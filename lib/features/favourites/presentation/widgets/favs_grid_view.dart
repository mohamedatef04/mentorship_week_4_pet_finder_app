import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/features/favourites/data/models/fav_item_model.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/cubits/get_fav_pets/get_fav_pets_cubit.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/widgets/fav_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavsGridView extends StatelessWidget {
  const FavsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavPetsCubit, GetFavPetsState>(
      builder: (context, state) {
        if (state is GetFavPetsSuccessState) {
          return SliverGrid.builder(
            itemCount: state.favItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.69,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return FavItem(
                favItemModel: state.favItems[index],
              );
            },
          );
        } else if (state is GetFavPetsEmptyState) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Favorite Pets',
                  style: AppTextStyles.black24,
                ),
              ],
            ),
          );
        } else if (state is GetFavPetsErrorState) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage,
                  style: AppTextStyles.black24,
                ),
              ],
            ),
          );
        } else {
          return SliverGrid.builder(
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.69,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,
                child: FavItem(
                  favItemModel: FavItemModel.fromPlaceHolder(),
                ),
              );
            },
          );
        }
      },
    );
  }
}

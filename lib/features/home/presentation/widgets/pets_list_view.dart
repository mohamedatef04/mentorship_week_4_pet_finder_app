import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/presentation/cubits/get_all_pets_cubit/get_all_pets_cubit.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PetsListView extends StatelessWidget {
  const PetsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllPetsCubit, GetAllPetsState>(
      builder: (context, state) {
        if (state is GetAllPetsSuccessState) {
          return SliverList.builder(
            itemCount: state.pets.length,
            itemBuilder: (context, index) {
              return PetItem(
                petEntity: state.pets[index],
              );
            },
          );
        } else if (state is GetSearchedPetsSuccessState) {
          return SliverList.builder(
            itemCount: state.pets.length,
            itemBuilder: (context, index) {
              return PetItem(
                petEntity: state.pets[index],
              );
            },
          );
        } else if (state is GetAllPetsErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        } else if (state is GetAllPetsEmptyState) {
          return SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Pets Found',
                  style: AppTextStyles.darkGrey16,
                ),
              ],
            ),
          );
        } else {
          return SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,
                child: PetItem(
                  petEntity: PetEntity.fromPlaceholder(),
                ),
              );
            },
          );
        }
      },
    );
  }
}

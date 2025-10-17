import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app_task/features/favourites/data/models/fav_item_model.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/get_favourites_pets_use_case.dart';
part 'get_fav_pets_state.dart';

class GetFavPetsCubit extends Cubit<GetFavPetsState> {
  GetFavPetsCubit(this.getFavouritesPetsUseCase) : super(GetFavPetsInitial());
  final GetFavouritesPetsUseCase getFavouritesPetsUseCase;

  Future<void> getFavPets() async {
    emit(GetFavPetsLoadingState());
    final res = await getFavouritesPetsUseCase.call();
    res.fold(
      (l) => emit(GetFavPetsErrorState(errorMessage: l.errorMessage)),
      (r) {
        if (r.isEmpty) {
          emit(GetFavPetsEmptyState());
        } else {
          emit(GetFavPetsSuccessState(favItems: r));
        }
      },
    );
  }
}

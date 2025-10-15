import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/domain/use_cases/get_all_pets_use_case.dart';
import 'package:pet_finder_app_task/features/home/domain/use_cases/get_serched_pets_use_case.dart';
part 'get_all_pets_state.dart';

class GetAllPetsCubit extends Cubit<GetAllPetsState> {
  GetAllPetsCubit(this.getAllPetsUseCase, this.getSerchedPetsUseCase)
    : super(GetAllPetsInitial());
  final GetAllPetsUseCase getAllPetsUseCase;
  final GetSerchedPetsUseCase getSerchedPetsUseCase;

  Future<void> getAllPets() async {
    emit(GetAllPetsLoadingState());
    final res = await getAllPetsUseCase.call();
    res.fold(
      (l) => emit(GetAllPetsErrorState(errorMessage: l.errorMessage)),
      (r) => emit(GetAllPetsSuccessState(pets: r)),
    );
  }

  Future<void> getSearchedPets(String query) async {
    emit(GetAllPetsLoadingState());
    final res = await getSerchedPetsUseCase.call(query: query);
    res.fold((l) => emit(GetAllPetsErrorState(errorMessage: l.errorMessage)), (
      r,
    ) {
      if (r.isEmpty) {
        emit(GetAllPetsEmptyState());
      } else {
        emit(GetSearchedPetsSuccessState(pets: r));
      }
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/add_pet_to_fav_use_case.dart';
part 'add_pet_to_fav_cubit_state.dart';

class AddPetToFavCubitCubit extends Cubit<AddPetToFavCubitState> {
  AddPetToFavCubitCubit(this.addPetToFavUseCase)
    : super(AddPetToFavCubitInitial());
  final AddPetToFavUseCase addPetToFavUseCase;

  Future<void> addPetToFav({required String petId}) async {
    final result = await addPetToFavUseCase(petId: petId);
    result.fold(
      (l) => emit(AddPetToFavCubitErrorState(errorMessage: l.errorMessage)),
      (r) => emit(AddPetToFavCubitSuccessState()),
    );
  }
}

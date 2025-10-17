import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/remove_from_favourites_use_case.dart';
part 'remove_from_favs_state.dart';

class RemoveFromFavsCubit extends Cubit<RemoveFromFavsState> {
  RemoveFromFavsCubit(this.removeFromFavouritesUseCase)
    : super(RemoveFromFavsInitial());

  final RemoveFromFavouritesUseCase removeFromFavouritesUseCase;

  Future<void> removeFromFav({required String petId}) async {
    emit(RemoveFromFavsLoadingState());
    final res = await removeFromFavouritesUseCase.call(petId: petId);
    res.fold(
      (l) => emit(RemoveFromFavsErrorState(errorMessage: l.errorMessage)),
      (r) => emit(RemoveFromFavsSuccessState()),
    );
  }
}

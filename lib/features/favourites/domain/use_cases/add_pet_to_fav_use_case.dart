import 'package:dartz/dartz.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/favourites/domain/repos/favourites_repo.dart';

class AddPetToFavUseCase {
  final FavouritesRepo favouriteRepo;
  AddPetToFavUseCase({required this.favouriteRepo});

  Future<Either<Failures, void>> call({required String petId}) async =>
      await favouriteRepo.addFavouritePet(petId: petId);
}

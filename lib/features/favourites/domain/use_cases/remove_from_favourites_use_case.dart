import 'package:dartz/dartz.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/favourites/domain/repos/favourites_repo.dart';

class RemoveFromFavouritesUseCase {
  final FavouritesRepo favouritesRepo;
  RemoveFromFavouritesUseCase({required this.favouritesRepo});

  Future<Either<Failures, void>> call({required String petId}) {
    return favouritesRepo.deleteFavouritePet(petId: petId);
  }
}

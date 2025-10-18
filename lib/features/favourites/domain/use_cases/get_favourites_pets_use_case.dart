import 'package:dartz/dartz.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/favourites/data/models/fav_item_model.dart';
import 'package:pet_finder_app_task/features/favourites/domain/repos/favourites_repo.dart';

class GetFavouritesPetsUseCase {
  final FavouritesRepo favouriteRepo;
  GetFavouritesPetsUseCase({required this.favouriteRepo});

  Future<Either<Failures, List<FavItemModel>>> call() async =>
      await favouriteRepo.getFavouritePets();
}

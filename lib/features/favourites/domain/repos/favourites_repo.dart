import 'package:dartz/dartz.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/favourites/data/models/fav_item_model.dart';

abstract class FavouritesRepo {
  Future<Either<Failures, List<FavItemModel>>> getFavouritePets();
  Future<Either<Failures, void>> addFavouritePet({required String petId});
  Future<Either<Failures, void>> deleteFavouritePet({required String petId});
}

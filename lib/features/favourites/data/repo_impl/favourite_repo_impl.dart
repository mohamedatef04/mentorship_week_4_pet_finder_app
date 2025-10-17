import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/favourites/data/data_source/favourites_data_source.dart';
import 'package:pet_finder_app_task/features/favourites/data/models/fav_item_model.dart';
import 'package:pet_finder_app_task/features/favourites/domain/repos/favourites_repo.dart';

class FavouriteRepoImpl implements FavouritesRepo {
  final FavouritesDataSource favouritesDataSource;
  FavouriteRepoImpl({required this.favouritesDataSource});
  @override
  Future<Either<Failures, List<FavItemModel>>> getFavouritePets() async {
    try {
      final res = await favouritesDataSource.getFavouritePets();
      return Right(res);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> addFavouritePet({
    required String petId,
  }) async {
    try {
      await favouritesDataSource.addFavouritePet(petId: petId);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> deleteFavouritePet({
    required String petId,
  }) async {
    try {
      await favouritesDataSource.deleteFavouritePet(petId: petId);
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

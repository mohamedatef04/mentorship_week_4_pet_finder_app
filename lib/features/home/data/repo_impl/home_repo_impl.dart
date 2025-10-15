import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/home/data/data_source/home_data_source.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource homeDataSource;

  HomeRepoImpl({required this.homeDataSource});
  @override
  Future<Either<Failures, List<PetEntity>>> getAllPets() async {
    try {
      final res = await homeDataSource.getAllPets();
      return Right(res);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<PetEntity>>> getSearchedPets({
    required String query,
  }) async {
    try {
      final res = await homeDataSource.getSearchedPets(query: query);
      return Right(res);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

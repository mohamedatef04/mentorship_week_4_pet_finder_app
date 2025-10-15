import 'package:dartz/dartz.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<PetEntity>>> getAllPets();

  Future<Either<Failures, List<PetEntity>>> getSearchedPets({
    required String query,
  });
}

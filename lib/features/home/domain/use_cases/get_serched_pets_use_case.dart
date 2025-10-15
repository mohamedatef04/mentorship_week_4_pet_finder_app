import 'package:dartz/dartz.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/domain/repos/home_repo.dart';

class GetSerchedPetsUseCase {
  final HomeRepo homeRepo;
  GetSerchedPetsUseCase({required this.homeRepo});

  Future<Either<Failures, List<PetEntity>>> call({
    required String query,
  }) async => homeRepo.getSearchedPets(query: query);
}

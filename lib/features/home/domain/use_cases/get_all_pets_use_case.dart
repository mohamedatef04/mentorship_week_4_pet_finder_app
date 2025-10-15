import 'package:dartz/dartz.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/domain/repos/home_repo.dart';

class GetAllPetsUseCase {
  final HomeRepo homeRepo;
  GetAllPetsUseCase(this.homeRepo);
  Future<Either<Failures, List<PetEntity>>> call() async =>
      homeRepo.getAllPets();
}

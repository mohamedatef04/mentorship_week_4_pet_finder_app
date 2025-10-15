import 'package:pet_finder_app_task/core/constants/api_constants.dart';
import 'package:pet_finder_app_task/core/services/api_service.dart';
import 'package:pet_finder_app_task/features/home/data/models/pet_model.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';

abstract class HomeDataSource {
  Future<List<PetEntity>> getAllPets();
  Future<List<PetEntity>> getSearchedPets({required String query});
}

class HomeDataSourceImpl implements HomeDataSource {
  final ApiService apiService;

  HomeDataSourceImpl(this.apiService);
  @override
  Future<List<PetEntity>> getAllPets() async {
    final res = await apiService.getRequest(
      endpoint: ApiConstants.getAllPetsendPoint,
    );
    final List<dynamic> jsonData = res.data as List<dynamic>;
    List<PetEntity> pets = jsonData
        .map(
          (e) => PetModel.fromJson(e as Map<String, dynamic>),
        )
        .toList();
    return pets;
  }

  @override
  Future<List<PetEntity>> getSearchedPets({required String query}) async {
    final res = await apiService.getRequest(
      endpoint: ApiConstants.getAllPetsendPoint,
    );
    final List<dynamic> jsonData = res.data as List<dynamic>;
    List<PetEntity> pets = jsonData
        .map(
          (e) => PetModel.fromJson(e as Map<String, dynamic>),
        )
        .toList();
    final filteredPets = pets
        .where((pet) => pet.petName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredPets;
  }
}

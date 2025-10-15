part of 'get_all_pets_cubit.dart';

@immutable
abstract class GetAllPetsState {}

class GetAllPetsInitial extends GetAllPetsState {}

class GetAllPetsLoadingState extends GetAllPetsState {}

class GetAllPetsEmptyState extends GetAllPetsState {}

class GetSearchedPetsSuccessState extends GetAllPetsState {
  final List<PetEntity> pets;
  GetSearchedPetsSuccessState({required this.pets});

  List<Object> get props => [pets];
}

class GetAllPetsSuccessState extends GetAllPetsState {
  final List<PetEntity> pets;
  GetAllPetsSuccessState({required this.pets});

  List<Object> get props => [pets];
}

class GetAllPetsErrorState extends GetAllPetsState {
  final String errorMessage;
  GetAllPetsErrorState({required this.errorMessage});
}

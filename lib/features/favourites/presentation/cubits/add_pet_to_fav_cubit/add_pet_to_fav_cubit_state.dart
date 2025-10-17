part of 'add_pet_to_fav_cubit_cubit.dart';

abstract class AddPetToFavCubitState extends Equatable {
  const AddPetToFavCubitState();

  @override
  List<Object> get props => [];
}

class AddPetToFavCubitInitial extends AddPetToFavCubitState {}

class AddPetToFavCubitSuccessState extends AddPetToFavCubitState {}

class AddPetToFavCubitErrorState extends AddPetToFavCubitState {
  final String errorMessage;
  const AddPetToFavCubitErrorState({required this.errorMessage});
}

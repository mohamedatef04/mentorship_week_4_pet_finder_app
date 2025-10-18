part of 'get_fav_pets_cubit.dart';

@immutable
abstract class GetFavPetsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFavPetsInitial extends GetFavPetsState {}

class GetFavPetsLoadingState extends GetFavPetsState {}

class GetFavPetsEmptyState extends GetFavPetsState {}

class GetFavPetsSuccessState extends GetFavPetsState {
  final List<FavItemModel> favItems;
  GetFavPetsSuccessState({required this.favItems});

  @override
  List<Object?> get props => [favItems];
}

class GetFavPetsErrorState extends GetFavPetsState {
  final String errorMessage;
  GetFavPetsErrorState({required this.errorMessage});
}

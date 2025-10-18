part of 'remove_from_favs_cubit.dart';

abstract class RemoveFromFavsState extends Equatable {
  const RemoveFromFavsState();

  @override
  List<Object> get props => [];
}

class RemoveFromFavsInitial extends RemoveFromFavsState {}

class RemoveFromFavsLoadingState extends RemoveFromFavsState {}

class RemoveFromFavsSuccessState extends RemoveFromFavsState {}

class RemoveFromFavsErrorState extends RemoveFromFavsState {
  final String errorMessage;
  const RemoveFromFavsErrorState({required this.errorMessage});
}

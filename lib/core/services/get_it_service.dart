import 'package:get_it/get_it.dart';
import 'package:pet_finder_app_task/core/services/api_service.dart';
import 'package:pet_finder_app_task/features/favourites/data/data_source/favourites_data_source.dart';
import 'package:pet_finder_app_task/features/favourites/data/repo_impl/favourite_repo_impl.dart';
import 'package:pet_finder_app_task/features/favourites/domain/repos/favourites_repo.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/add_pet_to_fav_use_case.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/get_favourites_pets_use_case.dart';
import 'package:pet_finder_app_task/features/favourites/domain/use_cases/remove_from_favourites_use_case.dart';
import 'package:pet_finder_app_task/features/home/data/data_source/home_data_source.dart';
import 'package:pet_finder_app_task/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:pet_finder_app_task/features/home/domain/repos/home_repo.dart';
import 'package:pet_finder_app_task/features/home/domain/use_cases/get_all_pets_use_case.dart';
import 'package:pet_finder_app_task/features/home/domain/use_cases/get_serched_pets_use_case.dart';

final getIt = GetIt.instance;

void getItSetup() {
  //* dependency injection for homeview
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
  getIt.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeDataSource: getIt.get<HomeDataSource>()),
  );
  getIt.registerLazySingleton<GetAllPetsUseCase>(
    () => GetAllPetsUseCase(getIt.get<HomeRepo>()),
  );
  getIt.registerLazySingleton<GetSerchedPetsUseCase>(
    () => GetSerchedPetsUseCase(homeRepo: getIt.get<HomeRepo>()),
  );

  //* dependency injection for favouritesview
  getIt.registerLazySingleton<FavouritesDataSource>(
    () => FavouritesDataSourceImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerLazySingleton<FavouritesRepo>(
    () => FavouriteRepoImpl(
      favouritesDataSource: getIt.get<FavouritesDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetFavouritesPetsUseCase>(
    () => GetFavouritesPetsUseCase(favouriteRepo: getIt.get<FavouritesRepo>()),
  );
  getIt.registerLazySingleton<AddPetToFavUseCase>(
    () => AddPetToFavUseCase(favouriteRepo: getIt.get<FavouritesRepo>()),
  );
  getIt.registerLazySingleton<RemoveFromFavouritesUseCase>(
    () => RemoveFromFavouritesUseCase(
      favouritesRepo: getIt.get<FavouritesRepo>(),
    ),
  );
}

import 'package:pet_finder_app_task/core/constants/api_constants.dart';
import 'package:pet_finder_app_task/core/services/api_service.dart';
import 'package:pet_finder_app_task/features/favourites/data/models/fav_item_model.dart';

abstract class FavouritesDataSource {
  Future<List<FavItemModel>> getFavouritePets();
  Future<void> addFavouritePet({required String petId});
  Future<void> deleteFavouritePet({required String petId});
}

class FavouritesDataSourceImpl implements FavouritesDataSource {
  final ApiService apiService;

  FavouritesDataSourceImpl({required this.apiService});

  @override
  Future<List<FavItemModel>> getFavouritePets() async {
    final res = await apiService.getRequest(
      endpoint: ApiConstants.getFavoritesEndPoint,
    );
    final List<dynamic> jsonData = res.data as List<dynamic>;
    List<FavItemModel> favItems = jsonData
        .map((e) => FavItemModel.fromJson(e))
        .toList();
    return favItems;
  }

  @override
  Future<void> addFavouritePet({required String petId}) async {
    await apiService.postRequest(
      endpoint: ApiConstants.getFavoritesEndPoint,
      data: {
        'image_id': petId,
        'sub_id': 'my-user-1234',
      },
    );
  }

  @override
  Future<void> deleteFavouritePet({required String petId}) async {
    await apiService.deleteRequest(
      endpoint: '${ApiConstants.deleteFavoritesEndPoint}$petId',
    );
  }
}

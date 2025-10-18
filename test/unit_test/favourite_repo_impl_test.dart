import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:pet_finder_app_task/features/favourites/data/data_source/favourites_data_source.dart';
import 'package:pet_finder_app_task/features/favourites/data/models/fav_item_model.dart';
import 'package:pet_finder_app_task/features/favourites/data/repo_impl/favourite_repo_impl.dart';

import 'favourite_repo_impl_test.mocks.dart';

@GenerateMocks([FavouritesDataSource])
void main() {
  late FavouriteRepoImpl favouriteRepo;
  late MockFavouritesDataSource mockFavouritesDataSource;

  setUp(() {
    mockFavouritesDataSource = MockFavouritesDataSource();
    favouriteRepo = FavouriteRepoImpl(
      favouritesDataSource: mockFavouritesDataSource,
    );
  });

  group('FavouriteRepoImpl Tests', () {
    test(
      '✅ should return list of favourites when data source succeeds',
      () async {
        final favs = [FavItemModel.fromPlaceHolder()];

        when(
          mockFavouritesDataSource.getFavouritePets(),
        ).thenAnswer((_) async => favs);
        final result = await favouriteRepo.getFavouritePets();

        expect(result, Right(favs));
        verify(mockFavouritesDataSource.getFavouritePets()).called(1);
      },
    );

    test(
      '❌ should return ServerFailure when DioException is thrown in getFavouritePets',
      () async {
        when(mockFavouritesDataSource.getFavouritePets()).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/favourites'),
            response: Response(
              requestOptions: RequestOptions(path: '/favourites'),
              statusCode: 500,
              statusMessage: 'Server error',
            ),
          ),
        );
        final result = await favouriteRepo.getFavouritePets();
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Should not succeed'),
        );
      },
    );

    test('✅ should return Right(null) when addFavouritePet succeeds', () async {
      // arrange
      when(
        mockFavouritesDataSource.addFavouritePet(petId: '1'),
      ).thenAnswer((_) async => Future.value());
      final result = await favouriteRepo.addFavouritePet(petId: '1');
      expect(result, const Right(null));
      verify(mockFavouritesDataSource.addFavouritePet(petId: '1')).called(1);
    });

    test(
      '❌ should return ServerFailure when DioException is thrown in addFavouritePet',
      () async {
        // arrange
        when(mockFavouritesDataSource.addFavouritePet(petId: '1')).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/favourites'),
            response: Response(
              requestOptions: RequestOptions(path: '/favourites'),
              statusCode: 500,
              statusMessage: 'Server error',
            ),
          ),
        );
        final result = await favouriteRepo.addFavouritePet(petId: '1');
        expect(result.isLeft(), true);
      },
    );

    test(
      '✅ should return Right(null) when deleteFavouritePet succeeds',
      () async {
        when(
          mockFavouritesDataSource.deleteFavouritePet(petId: '1'),
        ).thenAnswer((_) async => Future.value());
        final result = await favouriteRepo.deleteFavouritePet(petId: '1');
        expect(result, const Right(null));
        verify(
          mockFavouritesDataSource.deleteFavouritePet(petId: '1'),
        ).called(1);
      },
    );

    test(
      '❌ should return ServerFailure when DioException is thrown in deleteFavouritePet',
      () async {
        // arrange
        when(mockFavouritesDataSource.deleteFavouritePet(petId: '1')).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/favourites'),
            response: Response(
              requestOptions: RequestOptions(path: '/favourites'),
              statusCode: 404,
              statusMessage: 'Not Found',
            ),
          ),
        );
        final result = await favouriteRepo.deleteFavouritePet(petId: '1');
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Should not succeed'),
        );
      },
    );
  });
}

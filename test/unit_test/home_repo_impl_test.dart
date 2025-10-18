import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_finder_app_task/features/home/data/data_source/home_data_source.dart';
import 'package:pet_finder_app_task/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'home_repo_impl_test.mocks.dart';

@GenerateMocks([HomeDataSource])
void main() {
  late HomeRepoImpl homeRepo;
  late MockHomeDataSource mockHomeDataSource;

  setUp(() {
    mockHomeDataSource = MockHomeDataSource();
    homeRepo = HomeRepoImpl(homeDataSource: mockHomeDataSource);
  });

  group('HomeRepoImpl Tests', () {
    test('✅ should return list of pets when data source succeeds', () async {
      final pets = [
        PetEntity(
          petId: '1',
          petName: 'Fluffy',
          petOrigin: 'Egypt',
          petDescription: 'A cute cat',
          petLifeSpan: '12 years',
          petImageUrl: 'image.jpg',
        ),
      ];

      when(mockHomeDataSource.getAllPets()).thenAnswer((_) async => pets);

      final result = await homeRepo.getAllPets();

      expect(result, Right(pets));
      verify(mockHomeDataSource.getAllPets()).called(1);
    });

    test('❌ should return ServerFailure when DioException is thrown', () async {
      when(mockHomeDataSource.getAllPets()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/pets'),
          response: Response(
            requestOptions: RequestOptions(path: '/pets'),
            statusCode: 500,
            statusMessage: 'Internal Server Error',
            data: {'message': 'Something went wrong'},
          ),
          type: DioExceptionType.badResponse,
        ),
      );

      final result = await homeRepo.getAllPets();

      expect(result.isLeft(), true);
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (_) => fail('Should not succeed'),
      );
    });
  });
}

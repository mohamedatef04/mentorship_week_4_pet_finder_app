import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_item.dart';

void main() {
  testWidgets('PetItem displays name, origin, and life span', (tester) async {
    // Arrange: Sample PetEntity
    final pet = PetEntity(
      petId: '1',
      petName: 'Fluffy',
      petOrigin: 'Egypt',
      petDescription: 'Cute cat',
      petLifeSpan: '10 years',
      petImageUrl: '',
    );
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => MaterialApp(
          home: Scaffold(
            body: PetItem(
              petEntity: pet,

              // placeholder بدل الصورة
            ),
          ),
        ),
      ),
    );

    // Assert: تحقق من النصوص فقط
    expect(find.text('Fluffy'), findsOneWidget);
    expect(find.text('Egypt'), findsOneWidget);
    expect(find.text('10 years Life Span'), findsOneWidget);
  });
}

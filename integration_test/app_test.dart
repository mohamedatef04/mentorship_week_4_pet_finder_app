import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pet_finder_app_task/core/widgets/custom_nav_bar.dart';
import 'package:pet_finder_app_task/main.dart';
import 'package:pet_finder_app_task/core/services/get_it_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  tearDownAll(() async {
    await GetIt.instance.reset();
  });

  testWidgets('Full app flow test - Splash → OnBoarding → MainHomeView', (
    tester,
  ) async {
    getItSetup();

    await tester.pumpWidget(const PetFinderApp());
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsWidgets);
    expect(find.byType(SvgPicture), findsWidgets); // لو فيه SVG في الـ Splash

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Find Your Best Companion With Us'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);

    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    expect(find.byType(CustomNavBar), findsOneWidget);
    expect(find.byType(GNav), findsOneWidget);

    expect(find.text('Categories'), findsOneWidget);

    final favButton = find.byType(GButton).at(1);
    expect(favButton, findsOneWidget);
    await tester.tap(favButton);
    await tester.pumpAndSettle();

    expect(find.text('Your Favorite Pets'), findsOneWidget);
  });
}

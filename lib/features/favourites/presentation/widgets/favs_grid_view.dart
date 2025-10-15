import 'package:flutter/material.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/widgets/fav_item.dart';

class FavsGridView extends StatelessWidget {
  const FavsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.69,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return const FavItem();
      },
    );
  }
}

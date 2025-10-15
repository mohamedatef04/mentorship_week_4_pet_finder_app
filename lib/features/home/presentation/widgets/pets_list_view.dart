import 'package:flutter/material.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_item.dart';

class PetsListView extends StatelessWidget {
  const PetsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const PetItem();
      },
    );
  }
}

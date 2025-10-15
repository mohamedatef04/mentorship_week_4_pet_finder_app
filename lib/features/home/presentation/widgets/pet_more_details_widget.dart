import 'package:flutter/material.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_cutom_info_widget.dart';

class PetMoreDetailsWidget extends StatelessWidget {
  const PetMoreDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: PetCutomInfoWidget()),
        Expanded(child: PetCutomInfoWidget()),
        Expanded(child: PetCutomInfoWidget()),
      ],
    );
  }
}

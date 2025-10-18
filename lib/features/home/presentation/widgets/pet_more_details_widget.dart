import 'package:flutter/material.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_cutom_info_widget.dart';

class PetMoreDetailsWidget extends StatelessWidget {
  const PetMoreDetailsWidget({super.key, required this.petEntity});
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PetCutomInfoWidget(
            title: 'Origin',
            value: petEntity.petOrigin,
          ),
        ),
        Expanded(
          child: PetCutomInfoWidget(
            title: 'Lifespan',
            value: petEntity.petLifeSpan,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';

class PetAboutWidget extends StatelessWidget {
  const PetAboutWidget({super.key, required this.petEntity});
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About:',
          style: AppTextStyles.black24.copyWith(fontSize: 22.sp),
        ),
        Text(
          petEntity.petDescription,
          style: AppTextStyles.darkGrey16,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

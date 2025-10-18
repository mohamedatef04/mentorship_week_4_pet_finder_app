import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';

class PetDetailsNameAndPriceWidget extends StatelessWidget {
  const PetDetailsNameAndPriceWidget({super.key, required this.petEntity});
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Text(
            petEntity.petName,
            style: AppTextStyles.black28,
          ),
        ),

        Expanded(
          flex: 2,
          child: Text(
            '\$ 95',
            style: AppTextStyles.black28.copyWith(
              color: AppColors.primaryColor,
              fontSize: 26.sp,
            ),
          ),
        ),
      ],
    );
  }
}

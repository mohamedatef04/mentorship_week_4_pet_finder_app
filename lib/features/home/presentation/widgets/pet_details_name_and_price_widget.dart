import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';

class PetDetailsNameAndPriceWidget extends StatelessWidget {
  const PetDetailsNameAndPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Tom',
          style: AppTextStyles.black28,
        ),
        const Spacer(),
        Text(
          '\$ 95',
          style: AppTextStyles.black28.copyWith(
            color: AppColors.primaryColor,
            fontSize: 26.sp,
          ),
        ),
      ],
    );
  }
}

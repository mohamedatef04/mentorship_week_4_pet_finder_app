import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';

class PetCutomInfoWidget extends StatelessWidget {
  const PetCutomInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Container(
        width: 90.w,
        height: 75.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5.h,
          children: [
            Text('Gender', style: AppTextStyles.black18),
            Text('Male', style: AppTextStyles.darkGrey16),
          ],
        ),
      ),
    );
  }
}

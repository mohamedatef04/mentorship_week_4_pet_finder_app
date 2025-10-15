import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';

class CategoryIndexWidget extends StatelessWidget {
  const CategoryIndexWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.isSelected,
  });
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35.h,
        width: 58.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.white14.copyWith(
              color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

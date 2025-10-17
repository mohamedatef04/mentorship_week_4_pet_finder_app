import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_finder_app_task/core/constants/api_constants.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/presentation/views/pet_details_view.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key, required this.petEntity});
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    // بناء صورة الحيوان مع placeholder
    Widget petImage;
    if (petEntity.petImageUrl.isNotEmpty) {
      petImage = Container(
        width: 112.w,
        height: 112.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.lightGreyColor,
          image: DecorationImage(
            image: NetworkImage(
              '${ApiConstants.baseImageUrl}${petEntity.petImageUrl}.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
      );
    } else {
      petImage = Container(
        width: 112.w,
        height: 112.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.lightGreyColor,
        ),
        child: const Icon(
          Icons.pets,
          size: 50,
          color: Colors.grey,
        ), // Placeholder
      );
    }

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(PetDetailsView.routeName, extra: petEntity);
      },
      child: Card(
        color: AppColors.whiteColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.whiteColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              spacing: 10.w,
              children: [
                Expanded(child: petImage),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(petEntity.petName, style: AppTextStyles.black18),
                      Text(
                        petEntity.petOrigin,
                        style: AppTextStyles.darkGrey16.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        '${petEntity.petLifeSpan} Life Span',
                        style: AppTextStyles.darkGrey16.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/constants/api_constants.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_finder_app_task/features/home/presentation/views/pet_details_view.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key, required this.petEntity});
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    // بناء صورة الحيوان مع placeholder وآمان من فشل التحميل
    Widget petImage = Container(
      width: 112.w,
      height: 112.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.lightGreyColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: petEntity.petImageUrl.isNotEmpty
            ? Image.network(
                '${ApiConstants.baseImageUrl}${petEntity.petImageUrl}.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.pets,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              )
            : const Center(
                child: Icon(
                  Icons.pets,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
      ),
    );

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
              children: [
                Expanded(child: petImage),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(petEntity.petName, style: AppTextStyles.black18),
                      SizedBox(height: 5.h),
                      Text(
                        petEntity.petOrigin,
                        style: AppTextStyles.darkGrey16.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
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

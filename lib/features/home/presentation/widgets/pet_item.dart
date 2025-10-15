import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';
import 'package:pet_finder_app_task/features/home/presentation/views/pet_details_view.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(PetDetailsView.routeName);
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
                Expanded(
                  child: Container(
                    width: 112.w,
                    height: 112.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.lightGreyColor,
                      image: const DecorationImage(
                        image: AssetImage(Assets.imagesPet),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Tom',
                            style: AppTextStyles.black18,
                          ),
                          const Spacer(),

                          SvgPicture.asset(Assets.imagesHeart),
                        ],
                      ),
                      Text(
                        'Male',
                        style: AppTextStyles.darkGrey16.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        '1 year Old',
                        style: AppTextStyles.darkGrey16.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      Row(
                        spacing: 5.w,
                        children: [
                          SvgPicture.asset(Assets.imagesLocation),
                          Text(
                            '2.7 km away',
                            style: AppTextStyles.darkGrey16.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
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

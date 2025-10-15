import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';

class FavItem extends StatelessWidget {
  const FavItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            spacing: 5.h,
            children: [
              Container(
                width: 151.w,
                height: 140.h,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                  image: const DecorationImage(
                    image: AssetImage(Assets.imagesPet),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Tom',
                    style: AppTextStyles.black18.copyWith(fontSize: 14.sp),
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.imagesHeart),
                ],
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_finder_app_task/core/constants/api_constants.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';

class PetDetailsHeaderWidget extends StatelessWidget {
  const PetDetailsHeaderWidget({super.key, required this.petEntity});
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 350.h,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            image: DecorationImage(
              image: NetworkImage(
                '${ApiConstants.baseImageUrl}${petEntity.petImageUrl}.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primaryColor,
                  ),
                ),

                SvgPicture.asset(Assets.imagesHeart),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

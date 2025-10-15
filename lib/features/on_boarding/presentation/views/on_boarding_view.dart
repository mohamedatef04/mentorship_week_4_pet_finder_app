import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';
import 'package:pet_finder_app_task/features/on_boarding/presentation/widgets/custom_container_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = '/on-boarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              spacing: 20.h,
              children: [
                Image.asset(Assets.imagesOnBoarding2),
                SizedBox(height: 20.h),
                Text(
                  'Find Your Best Companion With Us',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.black32,
                ),
                Text(
                  'Join & discover the best suitable pets as per your preferences in your location',
                  style: AppTextStyles.darkGrey16,
                ),
                SizedBox(height: 20.h),
                CustomContainerButton(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5.w,
                    children: [
                      SvgPicture.asset(Assets.imagesIcon),
                      Text(
                        'Get started',
                        style: AppTextStyles.white18,
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

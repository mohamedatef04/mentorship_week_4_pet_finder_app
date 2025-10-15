import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_about_widget.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_details_header_widget.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_details_name_and_price_widget.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_more_details_widget.dart';
import 'package:pet_finder_app_task/features/on_boarding/presentation/widgets/custom_container_button.dart';

class PetDetailsView extends StatelessWidget {
  const PetDetailsView({super.key});
  static const routeName = '/pet-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0.w),
            child: SvgPicture.asset(Assets.imagesHeart1),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondaryColor,
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              children: [
                const PetDetailsHeaderWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,
                    children: [
                      const PetDetailsNameAndPriceWidget(),
                      Row(
                        spacing: 5.w,
                        children: [
                          SvgPicture.asset(Assets.imagesLocation),
                          Text(
                            '2.7 km away',
                            style: AppTextStyles.darkGrey16.copyWith(
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      const PetAboutWidget(),
                      const PetMoreDetailsWidget(),
                    ],
                  ),
                ),
                CustomContainerButton(
                  child: Center(
                    child: Text(
                      'Adopt me',
                      style: AppTextStyles.white18,
                    ),
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

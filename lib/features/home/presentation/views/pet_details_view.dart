import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';
import 'package:pet_finder_app_task/features/home/domain/entities/pet_entity.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_about_widget.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_details_header_widget.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_details_name_and_price_widget.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/pet_more_details_widget.dart';
import 'package:pet_finder_app_task/features/on_boarding/presentation/widgets/custom_container_button.dart';

class PetDetailsView extends StatelessWidget {
  const PetDetailsView({super.key, required this.petEntity});
  static const routeName = '/pet-details';
  final PetEntity petEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              children: [
                PetDetailsHeaderWidget(
                  petEntity: petEntity,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.h,
                    children: [
                      PetDetailsNameAndPriceWidget(
                        petEntity: petEntity,
                      ),
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
                      PetAboutWidget(
                        petEntity: petEntity,
                      ),
                      PetMoreDetailsWidget(
                        petEntity: petEntity,
                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';

class PetAboutWidget extends StatelessWidget {
  const PetAboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About:',
          style: AppTextStyles.black24.copyWith(fontSize: 22.sp),
        ),
        Text(
          'Tom is a playful and loyal Golden Retriever who loves being around people. He’s 1 years old, full of energy, and always ready for a game of fetch.',
          style: AppTextStyles.darkGrey16,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

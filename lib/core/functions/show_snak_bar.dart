import 'package:flutter/material.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';

void showSnakBar(
  BuildContext context, {
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        style: AppTextStyles.white18.copyWith(fontWeight: FontWeight.w400),
      ),
      backgroundColor: AppColors.primaryColor,
    ),
  );
}

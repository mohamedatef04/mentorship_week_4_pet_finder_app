import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.transparent,
      tabMargin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      haptic: true, // haptic feedback
      tabBorderRadius: 30.r,
      curve: Curves.easeIn, // tab animation curves
      duration: const Duration(milliseconds: 200), // tab animation duration
      gap: 6, // the tab button gap between icon and text
      iconSize: 20, // tab button icon size
      tabBackgroundColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
      onTabChange: (value) {
        setState(() {
          selectedIndex = value;
        });
      },
      tabs: [
        GButton(
          icon: Icons.circle,
          leading: selectedIndex == 0
              ? SvgPicture.asset(Assets.imagesHomeActive)
              : SvgPicture.asset(
                  Assets.imagesHome,
                ),
        ),

        GButton(
          icon: Icons.circle,
          leading: selectedIndex == 1
              ? SvgPicture.asset(Assets.imagesHeartActive)
              : SvgPicture.asset(
                  Assets.imagesHeart1,
                ),
        ),
        GButton(
          icon: Icons.person_2_outlined,
          leading: SvgPicture.asset(
            Assets.imagesMessages,
            colorFilter: ColorFilter.mode(
              selectedIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.darkGreyColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        GButton(
          icon: Icons.person_2_outlined,
          leading: SvgPicture.asset(
            Assets.imagesProfileCircle,
            colorFilter: ColorFilter.mode(
              selectedIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.darkGreyColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}

class NavBarCubit {}

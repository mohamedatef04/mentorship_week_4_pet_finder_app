import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_finder_app_task/core/theme/app_text_styles.dart';
import 'package:pet_finder_app_task/core/utils/assets.dart';

class HeaderTextAndIconWidget extends StatelessWidget {
  const HeaderTextAndIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Text('Find Your Forever Pet', style: AppTextStyles.black24),
        ),
        Expanded(child: SvgPicture.asset(Assets.imagesNotification)),
      ],
    );
  }
}

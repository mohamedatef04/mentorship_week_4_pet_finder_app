import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/core/theme/app_colors.dart';
import 'package:pet_finder_app_task/features/favourites/data/models/fav_item_model.dart';
import 'package:pet_finder_app_task/features/favourites/presentation/cubits/remove_from_favs/remove_from_favs_cubit.dart';

class FavItem extends StatelessWidget {
  const FavItem({super.key, required this.favItemModel});
  final FavItemModel favItemModel;

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
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                width: 151.w,
                height: 140.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(favItemModel.image.url),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightGreyColor,
                ),
                child: IconButton(
                  onPressed: () {
                    context.read<RemoveFromFavsCubit>().removeFromFav(
                      petId: favItemModel.id.toString(),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

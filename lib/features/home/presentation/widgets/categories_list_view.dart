import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app_task/features/home/presentation/widgets/category_index_widget.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Cats',
    'Dogs',
    'Birds',
    'Fish',
    'Reptiles',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: CategoryIndexWidget(
            title: categories[index],
            isSelected: index == selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

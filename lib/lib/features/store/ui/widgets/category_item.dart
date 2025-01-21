import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/app_palette.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.all(8.r),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppPalette.primaryLight : Colors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isSelected ? Colors.white : AppPalette.primaryLight,
            ),
      ),
    );
  }
}

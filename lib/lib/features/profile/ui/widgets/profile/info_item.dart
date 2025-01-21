import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/config/app_palette.dart';
import '../../../../../core/helpers/spacing.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 26.r,
          color: AppPalette.primaryLight,
        ),
        horizontalSpacing(10),
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppPalette.textPrimaryLight,
              ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/config/app_palette.dart';

class CheckIcon extends StatelessWidget {
  const CheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppPalette.primaryLight,
      radius: 40.r,
      child: CircleAvatar(
        backgroundColor: AppPalette.whiteColor,
        radius: 38.r,
        child: CircleAvatar(
          backgroundColor: AppPalette.primaryLight,
          radius: 36.r,
          child: Icon(
            Icons.check,
            color: AppPalette.whiteColor,
            size: 60.r,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/app_palette.dart';

class SaveDataButton extends StatelessWidget {
  const SaveDataButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.primaryLight,
          elevation: 10,
          shadowColor: AppPalette.blackColor,
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 60.w),
        ),
        onPressed: onPressed,
        child: Text(
          'Save',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppPalette.whiteColor),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/app_palette.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const PrimaryButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: AppPalette.disableColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          backgroundColor: AppPalette.primaryLight,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

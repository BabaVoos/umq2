import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/config/app_palette.dart';
import '../../../../../core/helpers/spacing.dart';

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPalette.whiteColor,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: AppPalette.primary.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            Icon(icon, color: AppPalette.blackColor),
            horizontalSpacing(20),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: AppPalette.primaryLight,
              radius: 13.r,
              child: CircleAvatar(
                backgroundColor: AppPalette.whiteColor,
                radius: 12.r,
                child: isSelected
                    ? CircleAvatar(
                        backgroundColor: AppPalette.primaryLight,
                        radius: 10.r,
                        child: const Icon(
                          Icons.check,
                          color: AppPalette.whiteColor,
                          size: 16,
                        ),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

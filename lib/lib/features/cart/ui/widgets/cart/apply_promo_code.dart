import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/app_palette.dart';
import '../../../../../core/config/text_styles_manager.dart';

class ApplyPromoCode extends StatelessWidget {
  const ApplyPromoCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: AppPalette.primaryLight,
            style: TextStylesManager.titleSmall,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.local_offer),
              hintText: "Add promo code",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppPalette.lightGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppPalette.lightGrey),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 16.r,
              vertical: 16.r,
            ),
          ),
          onPressed: () {
            // Apply promo code logic
          },
          child: Text(
            "Apply",
            style: TextStylesManager.titleSmall.copyWith(
              color: AppPalette.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}

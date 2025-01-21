import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/config/images_manager.dart';
import '../../../../../core/config/app_palette.dart';
import '../../../../../core/config/text_styles_manager.dart';
import '../../../../../core/helpers/spacing.dart';
import 'quantity_selector.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppPalette.lightGrey,
        ),
        color: AppPalette.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppPalette.greyColor,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppPalette.lightGrey,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(
              ImagesManager.faceMask,
              width: 60.r,
              height: 70.r,
              fit: BoxFit.contain,
            ),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Diving Glasses',
                  style: TextStylesManager.titleMedium
                      .copyWith(color: AppPalette.blackColor),
                ),
                verticalSpacing(5),
                Text('Size: Large', style: TextStylesManager.titleSmall),
                Text('Color: Black', style: TextStylesManager.titleSmall),
                verticalSpacing(10),
                Text(
                  '\$ 50.00',
                  style: TextStylesManager.titleLarge,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              verticalSpacing(10),
              const QuantitySelector(),
            ],
          ),
        ],
      ),
    );
  }
}

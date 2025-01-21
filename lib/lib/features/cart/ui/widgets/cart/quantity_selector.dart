import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/config/app_palette.dart';
import '../../../../../core/config/text_styles_manager.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppPalette.lightGrey,
        ),
        color: AppPalette.lightGrey,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (quantity == 1) return;
              setState(() {
                quantity--;
              });
            },
            icon: const Icon(
              Icons.remove,
              color: AppPalette.blackColor,
              size: 15,
            ),
          ),
          Text(
            quantity.toString(),
            style: TextStylesManager.titleMedium,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
            icon: const Icon(
              Icons.add,
              color: AppPalette.blackColor,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}

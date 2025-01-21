import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_palette.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/cart/cart_item_list_view.dart';
import '../widgets/cart/order_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.whiteColor,
      appBar: AppBar(
        backgroundColor: AppPalette.whiteColor,
        title: const Text('Your Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: ListView(
          children: [
            const CartItemListView(),
            verticalSpacing(20),
            const OrderSummary(),
          ],
        ),
      ),
    );
  }
}

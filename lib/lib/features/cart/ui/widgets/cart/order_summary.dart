import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import 'apply_promo_code.dart';
import 'summary_row.dart';
import '../../../../../core/config/app_palette.dart';
import '../../../../../core/config/text_styles_manager.dart';
import '../../../../../core/helpers/spacing.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppPalette.lightGrey,
        ),
        color: AppPalette.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppPalette.lightGrey,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildOrderSummary(),
          verticalSpacing(20),
          const ApplyPromoCode(),
          verticalSpacing(20),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(Routes.paymentScreen);
            },
            child: Text(
              'Go to Checkout',
              style: TextStylesManager.titleLarge.copyWith(color: AppPalette.whiteColor),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: TextStylesManager.titleLarge,
        ),
        verticalSpacing(10),
        const SummaryRow(
          title: 'Subtotal',
          value: '\$515',
        ),
        verticalSpacing(10),
        const SummaryRow(
          title: 'Dicsount',
          value: '\$113',
        ),
        verticalSpacing(10),
        const SummaryRow(
          title: 'Delivery Fee',
          value: '\$20',
        ),
        const Divider(
          height: 50,
          color: AppPalette.greyColor,
        ),
        const SummaryRow(title: 'Total', value: '\$467', isTotal: true),
      ],
    );
  }
}

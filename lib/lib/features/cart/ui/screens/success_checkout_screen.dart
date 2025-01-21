import 'package:flutter/material.dart';
import '../widgets/success_checkout/body_container.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/config/app_palette.dart';

class SuccessCheckoutScreen extends StatelessWidget {
  const SuccessCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.primaryLight,
      appBar: AppBar(
        backgroundColor: AppPalette.primaryLight,
        elevation: 0,
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: AppPalette.whiteColor,
          ),
        ),
      ),
      body: Column(
        children: [
          verticalSpacing(70),
          Center(
            child: Text(
              'Thank You !',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppPalette.textWhite,
                  ),
            ),
          ),
          verticalSpacing(50),
          const BodyContainer(),
        ],
      ),
    );
  }
}

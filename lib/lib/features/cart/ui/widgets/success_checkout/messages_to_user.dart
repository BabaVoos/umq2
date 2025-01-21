import 'package:flutter/material.dart';
import '../../../../../core/config/app_palette.dart';
import '../../../../../core/helpers/spacing.dart';

class MessagesToUser extends StatelessWidget {
  const MessagesToUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Payment Successful',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppPalette.blackColor,
              ),
        ),
        verticalSpacing(10),
        Text(
          'your order will be delivered to you in next 2-3 working days ',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppPalette.textGrey,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

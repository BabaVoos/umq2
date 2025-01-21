import 'package:flutter/material.dart';

import '../../../../core/config/app_palette.dart';

class SecondayButton extends StatelessWidget {
  const SecondayButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: AppPalette.primaryLight,
            width: 2,
          ),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppPalette.textPrimaryLight,
                height: 3,
              ),
        ),
      ),
    );
  }
}

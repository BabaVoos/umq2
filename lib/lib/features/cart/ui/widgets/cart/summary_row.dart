import 'package:flutter/material.dart';

import '../../../../../core/config/app_palette.dart';
import '../../../../../core/config/text_styles_manager.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  final String title;
  final String value;
  final bool? isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStylesManager.titleMedium.copyWith(
            color: AppPalette.greyColor,
          ),
        ),
        Text(
          value,
          style: isTotal!
              ? TextStylesManager.titleLarge
              : TextStylesManager.titleMedium,
        ),
      ],
    );
  }
}

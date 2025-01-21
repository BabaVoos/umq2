import 'package:flutter/material.dart';
import '../../../../core/config/app_palette.dart';

class GradientTitle extends StatelessWidget {
  const GradientTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          AppPalette.gradientOne,
          AppPalette.gradientTwo,
          AppPalette.gradientThree,
        ],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
      ).createShader(bounds),
      child: const Text(
        "UMQ",
        style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

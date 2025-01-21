import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umq/lib/core/helpers/extensions.dart';

import '../../../../core/config/app_palette.dart';
import '../../../../core/config/images_manager.dart';

class OnBoardingDetails extends StatelessWidget {
  final String image;
  final String description;
  final void Function()? onPressed;

  const OnBoardingDetails(
      {super.key,
      required this.image,
      required this.description,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
      child: SizedBox(
        height: context.screenSize.height * 0.4,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                ImagesManager.onBoardingWave,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppPalette.primaryLight),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: SizedBox(
                width: 150,
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.only(end: 12, bottom: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPalette.primary,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      'Next',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppPalette.textWhite),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

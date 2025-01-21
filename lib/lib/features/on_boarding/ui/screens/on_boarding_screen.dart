import 'package:flutter/material.dart';
import 'package:umq/lib/core/helpers/extensions.dart';
import '../../../../core/config/app_palette.dart';
import '../../../../core/config/images_manager.dart';
import '../../../../core/networking/shared_pref.dart';
import 'on_boarding_details.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();

  final List onBoardingScreensDetails = [
    {
      'image': ImagesManager.onBoardingOne,
      'description':
          'on the occasion of opening our application, we offer you a free subscription ..... ',
    },
    {
      'image': ImagesManager.onBoardingTwo,
      'description':
          'on the occasion of opening our application, we offer you a free subscription ..... ',
    },
  ];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              context.pushReplacementNamed('loginScreen');
              SharedPrefService.pref.setBool('isFirstTime', false);
            },
            child: Text(
              'skip',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppPalette.textWhite),
            ),
          )
        ],
      ),
      body: PageView.builder(
        itemCount: onBoardingScreensDetails.length,
        controller: controller,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => OnBoardingDetails(
          onPressed: () {
            if (index == 0) {
              controller.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            } else {
              context.pushReplacementNamed('loginScreen');
              SharedPrefService.pref.setBool('isFirstTime', false);
            }
          },
          image: onBoardingScreensDetails[index]['image'],
          description: onBoardingScreensDetails[index]['description'],
        ),
      ),
    );
  }
}

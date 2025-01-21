import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'core/helpers/extensions.dart';
import 'core/config/app_palette.dart';
import 'core/config/images_manager.dart';
import 'core/networking/shared_pref.dart';

import 'core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animationController.addListener(() {
      animationController.status == AnimationStatus.completed
          ? checkUserLoginStatus()
          : null;
    });
    super.initState();
  }

  Future<void> checkUserLoginStatus() async {
    final bool? isFirstTime = SharedPrefService.pref.getBool('isFirstTime');
    if (isFirstTime != false) {
      context.pushReplacementNamed(Routes.onBoardingScreen);
      return;
    }
    final String? authToken = await SharedPrefService.getSecureString('token');
    if (authToken.isNullOrEmpty()) {
      // Redirect to the login screen if the user is not logged in
      context.pushReplacementNamed(Routes.loginScreen);
    } else {
      // Redirect to the main navigation screen if the user is logged in
      context.pushReplacementNamed(Routes.navScreen);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF000b3a),
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => ShaderMask(
                shaderCallback: (bounds) {
                  final alignment = Alignment.lerp(Alignment.topLeft,
                      Alignment.bottomRight, animationController.value);
                  return LinearGradient(
                    colors: const [
                      AppPalette.gradientOne,
                      AppPalette.gradientTwo,
                      AppPalette.gradientThree,
                    ],
                    begin: alignment!,
                    end: Alignment.centerLeft,
                  ).createShader(bounds);
                },
                child: const Text(
                  "UMQ",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              ImagesManager.splashWave,
              width: MediaQuery.sizeOf(context).width,
            ),
          )
        ],
      ),
    );
  }
}

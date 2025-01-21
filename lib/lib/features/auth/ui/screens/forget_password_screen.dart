import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/config/app_palette.dart';
import '../../../../core/config/images_manager.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/primary_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFfff2d8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: context.screenSize.height * 0.2,
            child: RotatedBox(
              quarterTurns: 2,
              child: SvgPicture.asset(
                ImagesManager.splashWave,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Forgot Password",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppPalette.textLightBlue,
                ),
          ),
          SvgPicture.asset(
            ImagesManager.forgetPassword,
            width: 200.r,
            height: 200.r,
          ),
          verticalSpacing(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Enter your registered email below to receive password reset instruction",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppPalette.textLightBlue,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 20.0),
            child: PrimaryButton(
              text: 'send verification code',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:umq/lib/core/helpers/extensions.dart';

import '../../../../core/config/app_palette.dart';
import '../../../../core/config/images_manager.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/primary_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final TextEditingController code1 = TextEditingController();
  final TextEditingController code2 = TextEditingController();
  final TextEditingController code3 = TextEditingController();
  final TextEditingController code4 = TextEditingController();
  final FocusNode focus1 = FocusNode();
  final FocusNode focus2 = FocusNode();
  final FocusNode focus3 = FocusNode();
  final FocusNode focus4 = FocusNode();
  @override
  void dispose() {
    code1.dispose();
    code2.dispose();
    code3.dispose();
    code4.dispose();
    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            "Verify Account",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppPalette.textLightBlue,
                ),
          ),
          verticalSpacing(20),
          Text(
            "Enter 4 digit code we have sent to testing@gmail.com",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppPalette.textLightBlue,
                ),
            textAlign: TextAlign.center,
          ),
          verticalSpacing(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              spacing: 20.w,
              children: [
                textField(code1, focus1, nextNode: focus2),
                textField(code2, focus2, nextNode: focus3),
                textField(code3, focus3, nextNode: focus4),
                textField(code4, focus4),
              ],
            ),
          ),
          verticalSpacing(20),
          Text(
            "Enter 4 digit code we have sent to testing@gmail.com",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppPalette.textLightBlue,
                ),
            textAlign: TextAlign.center,
          ),
          verticalSpacing(20),
          Text(
            "Resend Code",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppPalette.textLightBlue,
                  decoration: TextDecoration.underline,
                ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.h),
            child: const PrimaryButton(
              text: 'verification now',
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(controller, FocusNode focusNode, {FocusNode? nextNode}) {
    return Expanded(
      child: TextFormField(
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          if (nextNode == null) {
            focusNode.unfocus();
          }

          FocusScope.of(context).requestFocus(nextNode);
        },
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Allows only digits
        ],
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppPalette.textLightBlue,
            ),
        decoration: const InputDecoration(
          counterText: '',
          labelStyle: TextStyle(color: AppPalette.textLightBlue),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppPalette.textLightBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppPalette.textLightBlue),
          ),
        ),
      ),
    );
  }
}

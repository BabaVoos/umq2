import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/config/app_palette.dart';
import '../../../../../core/helpers/spacing.dart';
import 'check_icon.dart';
import 'messages_to_user.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: AppPalette.whiteColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(170),
            topEnd: Radius.circular(170),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h),
          child: Column(
            children: [
              verticalSpacing(40),
              const CheckIcon(),
              verticalSpacing(40),
              const MessagesToUser(),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Continue Shopping',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppPalette.whiteColor,
                      ),
                ),
              ),
              verticalSpacing(50),
            ],
          ),
        ),
      ),
    );
  }
}

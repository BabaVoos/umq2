import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:umq/lib/core/helpers/extensions.dart';
import '../../../../../core/config/app_palette.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/routing/routes.dart';
import 'info_item.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildUserInfo(context),
          verticalSpacing(60),
          const InfoItem(
            text: '0123456789',
            icon: Icons.phone_in_talk_rounded,
          ),
          verticalSpacing(20),
          const InfoItem(
            text: 'Jeddah',
            icon: Icons.location_on_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Mariam Mekhail',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24.sp),
            ),
            IconButton(
              onPressed: () {
                context.pushNamed(Routes.editProfielScreen);
              },
              icon: const Icon(
                Icons.edit_outlined,
                color: AppPalette.primaryLight,
              ),
            ),
          ],
        ),
        Text(
          'mariammekhail59@gmail.com',
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
      ],
    );
  }
}

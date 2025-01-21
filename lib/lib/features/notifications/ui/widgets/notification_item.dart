import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_palette.dart';
import '../../../../core/helpers/spacing.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundImage: const NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6SGvshARHJ5GYSH_Kig8-cYNw5rO3nWn7mA&s'),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enjoy your trip',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpacing(5),
                Text(
                  'your trip is delivered!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          horizontalSpacing(10),
          Text(
            '12:30 PM',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppPalette.primaryLight),
          ),
        ],
      ),
    );
  }
}

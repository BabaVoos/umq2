import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/app_palette.dart';
import 'notification_item.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: AppPalette.textGrey,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return const NotificationItem();
      },
      padding: EdgeInsets.symmetric(vertical: 20.h),
    );
  }
}

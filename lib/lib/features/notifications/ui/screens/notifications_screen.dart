import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/app_palette.dart';
import '../widgets/notifications_list_view.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Column _buildBody() {
    return Column(
      children: [
        _buildMyDivider(),
        const Expanded(
          child: NotificationsListView(),
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppPalette.whiteColor,
      centerTitle: true,
      title: Text(
        'Your Latest Activites...',
        style:
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20.sp),
      ),
    );
  }

  Container _buildMyDivider() {
    return Container(
      decoration: const BoxDecoration(
        color: AppPalette.primaryLight,
        boxShadow: [
          BoxShadow(
            color: AppPalette.primaryLight,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      width: double.infinity,
      height: 3.h,
    );
  }
}

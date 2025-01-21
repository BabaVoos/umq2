import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/app_palette.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.imageUrl,
    this.isEdit,
  });

  final String imageUrl;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isEdit == true ? 120.h : 180.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: isEdit == true ? 80.h : 140.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppPalette.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1.h,
            child: CircleAvatar(
              radius: 45.r,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}

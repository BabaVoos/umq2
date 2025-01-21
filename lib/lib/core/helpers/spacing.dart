import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpacing(double height) => SizedBox(
      height: height.h,
    );
SizedBox horizontalSpacing(double width) => SizedBox(
      width: width.w,
    );

SliverToBoxAdapter verticalSpacingSliver(double height) => SliverToBoxAdapter(
      child: verticalSpacing(height),
    );

SliverToBoxAdapter horizontalSpacingSliver(double width) => SliverToBoxAdapter(
      child: horizontalSpacing(width),
    );

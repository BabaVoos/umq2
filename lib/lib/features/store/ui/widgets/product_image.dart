import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/config/app_palette.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.image, required this.index});
  final String image;
  final String index;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      start: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        width: 0.35.sw,
        height: 0.23.sh,
        decoration: const BoxDecoration(
          color: AppPalette.whiteColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(25),
            topEnd: Radius.circular(25),
            bottomEnd: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: AppPalette.primaryLight,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Hero(
          tag: index,
          child: Image.network(
            '${ApiConstants.baseUrl}/storage/$image',
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error,
                size: 50.r,
                color: AppPalette.primaryLight,
              );
            },
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/app_palette.dart';
import '../../../../core/helpers/spacing.dart';
import '../../models/get_products_response_mode.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final GetProductsResponseModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 0.4.sw,
        end: 20.w,
        top: 20.h,
        bottom: 20.h,
      ),
      width: double.infinity,
      height: 0.19.sh,
      decoration: const BoxDecoration(
        color: AppPalette.whiteColor,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          bottomEnd: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: AppPalette.textGrey,
            blurRadius: 1,
            offset: Offset(1, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name!,
            style: _textStyle(context),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          verticalSpacing(20),
          Text(
            "\$${product.price}",
            style: _textStyle(context),
          ),
          verticalSpacing(20),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange),
              horizontalSpacing(5),
              Text(
                product.stars.toString(),
                style: _textStyle(context),
              ),
              const Spacer(),
              const _AddToCartButton(),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w700,
        );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 15.r,
        backgroundColor: AppPalette.primaryLight,
        child: const Icon(
          Icons.add,
          color: AppPalette.whiteColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../models/get_products_response_mode.dart';
import 'product_details.dart';
import 'product_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final GetProductsResponseModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(Routes.productDetailsScreen, arguments: product);
        },
        child: SizedBox(
          height: 0.23.sh,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ProductDetails(
                product: product,
              ),
              ProductImage(
                image: product.image!,
                index: product.id.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/networking/api_constants.dart';
import '../../models/get_products_response_mode.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/config/app_palette.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final GetProductsResponseModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing(30),
            _buildProductImage(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                children: [
                  _buildProductInfo(context),
                  verticalSpacing(20),
                  _buildAddToCartButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Details'),
      centerTitle: true,
    );
  }

  Widget _buildProductImage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
      decoration: const BoxDecoration(
        color: AppPalette.whiteColor,
        borderRadius: BorderRadiusDirectional.only(
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
        tag: widget.product.id!,
        child: Image.network(
          '${ApiConstants.baseUrl}${widget.product.image}',
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.error,
              size: 0.5.sw,
              color: AppPalette.primaryLight,
            );
          },
          height: 0.2.sh,
          width: 0.5.sw,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildProductInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.product.name!,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppPalette.textBlack,
                  ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: AppPalette.primaryLight,
                size: 30,
              ),
            ),
          ],
        ),
        verticalSpacing(10),
        Row(
          children: [
            ...List.generate(
              widget.product.stars!,
              (index) => Icon(
                Icons.star,
                color: Colors.orange,
                size: 20.r,
              ),
            ),
            Text(
              '(${widget.product.stars})',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
          ],
        ),
        verticalSpacing(10),
        Text(
          widget.product.description!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppPalette.textGrey,
              ),
        ),
        verticalSpacing(20),
        Text(
          '\$${widget.product.price}',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppPalette.primaryLight,
              ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Add to cart',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppPalette.whiteColor,
              ),
        ),
      ),
    );
  }
}

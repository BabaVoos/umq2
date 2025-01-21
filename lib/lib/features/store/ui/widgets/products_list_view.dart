import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../bloc/store_cubit.dart';
import 'product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      buildWhen: (previous, current) =>
          current is GetProductsSuccess ||
          current is GetProductsFailed ||
          current is GetProductsLoading,
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetProductsFailed) {
          return Center(child: Text(state.message));
        } else if (state is GetProductsSuccess) {
          if (state.products.isEmpty) {
            return const Center(child: Text('No Products'));
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            separatorBuilder: (context, index) => verticalSpacing(30),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              if (state.products.isEmpty) {
                return const Center(child: Text('No data'));
              }
              return ProductItem(
                product: state.products[index],
              );
            },
          );
        }
        return const Center(
          child: Text(
            'No Products',
          ),
        );
      },
    );
  }
}

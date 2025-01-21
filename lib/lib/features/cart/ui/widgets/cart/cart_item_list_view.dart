import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import 'cart_item.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => verticalSpacing(20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const CartItem();
      },
    );
  }
}

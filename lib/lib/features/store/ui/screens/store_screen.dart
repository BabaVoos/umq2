import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/store_cubit.dart';
import '../widgets/products_list_view.dart';
import '../widgets/categories_list_view.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  void initState() {
    context.read<StoreCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  Column _buildBody(context) {
    return const Column(
      children: [
        CategoriesListView(
          categories: [
            'All',
            'For Head',
            'For Body',
            'For Feet',
            'For Hands',
            'More',
          ],
        ),
        Expanded(
          child: ProductsListView(),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Popular Products',
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
    );
  }
}

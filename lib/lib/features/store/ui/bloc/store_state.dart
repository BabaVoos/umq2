part of 'store_cubit.dart';

@immutable

sealed class StoreState {}

final class StoreInitial extends StoreState {}

final class GetProductsLoading extends StoreState {}

final class GetProductsSuccess extends StoreState {
  final List<GetProductsResponseModel> products;
  GetProductsSuccess({required this.products});
}

final class GetProductsFailed extends StoreState {
  final String message;
  GetProductsFailed({required this.message});
}

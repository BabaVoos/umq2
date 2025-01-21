import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/store_repo.dart';
import '../../../../core/networking/api_result.dart';
import '../../models/get_products_response_mode.dart';
part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final StoreRepo _storeRepo;
  StoreCubit(this._storeRepo) : super(StoreInitial());

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final result = await _storeRepo.getProducts();
    if (result is Success<List<GetProductsResponseModel>>) {
      emit(GetProductsSuccess(products: result.data));
    } else if (result is Error<List<GetProductsResponseModel>>) {
      emit(GetProductsFailed(message: result.message));
    }
  }
}

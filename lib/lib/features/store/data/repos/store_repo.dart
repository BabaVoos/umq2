import '../../../../core/networking/api_result.dart';
import '../api/store_api_service.dart';
import '../../models/get_products_response_mode.dart';

class StoreRepo {
  final StoreApiService _storeApiService;

  StoreRepo(this._storeApiService);


  Future<ApiResult<List<GetProductsResponseModel>>> getProducts() async {
    try {
      final response = await _storeApiService.getStore();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error('An error occurred');
    }
  }
}
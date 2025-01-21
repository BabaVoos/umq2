import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../core/networking/api_constants.dart';
import '../../models/get_products_response_mode.dart';
part 'store_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class StoreApiService {
  factory StoreApiService(Dio dio) = _StoreApiService;

  @GET(ApiConstants.productsEp)
  Future<List<GetProductsResponseModel>> getStore();
}

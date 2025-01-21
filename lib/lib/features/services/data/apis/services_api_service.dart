import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../core/networking/api_constants.dart';
import '../models/get_services_response_model.dart';
part 'services_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ServicesApiService {
  factory ServicesApiService(Dio dio) = _ServicesApiService;

  @GET(ApiConstants.servicesEp)
  Future<List<GetServicesResponseModel>> getServices();
}

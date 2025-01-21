import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../core/networking/api_constants.dart';
import '../../models/get_trainers_response_model.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.trainersEp)
  Future<GetTrainersResponseModel> getTrainers();
}
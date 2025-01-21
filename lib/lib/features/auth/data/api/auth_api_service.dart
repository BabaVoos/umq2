import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../models/login_request_model.dart';
import '../../models/login_response_model.dart';
import '../../../../core/networking/api_constants.dart';
import '../../models/register_request_model.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST(ApiConstants.loginEP)
  Future<LoginResponseModel> login(
    @Body() LoginRequestModel loginRequestModel,
  );

  @POST(ApiConstants.registerEP)
  Future<void> register(
    @Body() RegisterRequestModel registerRequestModel,
  );
}

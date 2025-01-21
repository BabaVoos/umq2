import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/shared_pref.dart';
import '../../models/register_request_model.dart';
import '../api/auth_api_service.dart';
import '../../models/login_request_model.dart';
import '../../models/login_response_model.dart';

class AuthRepo {
  final AuthApiService _authApiService;

  AuthRepo(this._authApiService);
  Future<ApiResult<LoginResponseModel>> signIn(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await _authApiService.login(loginRequestModel);
      SharedPrefService.setSecureString('token', response.token ?? '');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error('An error occurred');
    }
  }

  Future<ApiResult> register(RegisterRequestModel registerRequestModel) async {
    try {
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.error('An error occurred');
    }
  }
}

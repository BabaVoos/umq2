import 'package:flutter/material.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/services_api_service.dart';
import '../models/get_services_response_model.dart';

class ServicesRepo {
  final ServicesApiService _servicesApiService;

  ServicesRepo(this._servicesApiService);

  Future<ApiResult<List<GetServicesResponseModel>>> getServices() async {
    try {
      final response = await _servicesApiService.getServices();
      return ApiResult.success(response);
    } catch (e) {
      debugPrint(e.toString());
      return ApiResult.error('An error occurred');
    }
  }
}

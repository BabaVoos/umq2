import 'package:flutter/material.dart';

import '../../../../core/networking/api_result.dart';
import '../../models/get_trainers_response_model.dart';
import '../apis/home_api_service.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<List<Trainer>>> getTrainers() async {
    try {
      final response = await _homeApiService.getTrainers();
      return ApiResult.success(response.trainers);
    } catch (e) {
      debugPrint(e.toString());
      return ApiResult.error('An error occurred');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/get_services_response_model.dart';
import '../../data/repos/home_repo.dart';
part 'service_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepo _servicesRepo;
  ServicesCubit(this._servicesRepo) : super(ServicesInitial());

  Future<void> getTrainers() async {
    emit(ServicesLoading());
    final result = await _servicesRepo.getServices();
    if (result is Success<List<GetServicesResponseModel>>) {
      emit(ServiceSuccess(services: result.data));
    } else if (result is Error<List<GetServicesResponseModel>>) {
      debugPrint(result.message);
      emit(ServicesError(message: result.message));
    }
  }
}

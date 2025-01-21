import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repos/home_repo.dart';
import '../../models/get_trainers_response_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> getTrainers() async {
    emit(HomeLoading());
    final result = await _homeRepo.getTrainers();
    if (result is Success<List<Trainer>>) {
      emit(GetTrainersSuccess(trainers: result.data));
    } else if (result is Error<List<Trainer>>) {
      debugPrint(result.message);
      emit(HomeError(message: result.message));
    }
  }
}

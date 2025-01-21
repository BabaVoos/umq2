import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/login_request_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/auth_repo.dart';
import '../../models/login_response_model.dart';
import '../../models/register_request_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  void login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authRepo.signIn(LoginRequestModel(
      email: email,
      password: password,
    ));

    if (result is Success<LoginResponseModel>) {
      emit(LoginSuccess(loginResponseModel: result.data));
    } else if (result is Error<LoginResponseModel>) {
      emit(AuthFailed(message: result.message));
    }
  }

  void register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authRepo.register(
      RegisterRequestModel(
        name: name,
        email: email,
        password: password,
      ),
    );

    if (result is Success) {
      emit(RegisterSuccess());
    } else if (result is Error) {
      emit(AuthFailed(message: result.message));
    }
  }
}

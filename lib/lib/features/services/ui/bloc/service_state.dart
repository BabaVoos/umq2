part of 'service_cubit.dart';

@immutable
sealed class ServicesState {}

final class ServicesInitial extends ServicesState {}

final class ServicesLoading extends ServicesState {}

final class ServiceSuccess extends ServicesState {
  final List<GetServicesResponseModel> services;
  ServiceSuccess({required this.services});
}

final class ServicesError extends ServicesState {
  final String message;
  ServicesError({required this.message});
}

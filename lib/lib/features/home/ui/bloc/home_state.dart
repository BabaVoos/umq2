part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class GetTrainersSuccess extends HomeState {
  final List<Trainer> trainers;
  GetTrainersSuccess({required this.trainers});
}

final class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
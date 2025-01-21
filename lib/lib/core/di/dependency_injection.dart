import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/api/auth_api_service.dart';
import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/ui/bloc/auth_cubit.dart';
import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/ui/bloc/home_cubit.dart';
import '../../features/services/data/apis/services_api_service.dart';
import '../../features/services/data/repos/home_repo.dart';
import '../../features/services/ui/bloc/service_cubit.dart';
import '../../features/store/data/api/store_api_service.dart';
import '../../features/store/data/repos/store_repo.dart';
import '../../features/store/ui/bloc/store_cubit.dart';
import '../networking/dio_factory.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio));
  getIt
      .registerLazySingleton<AuthRepo>(() => AuthRepo(getIt<AuthApiService>()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));

  getIt.registerLazySingleton<StoreApiService>(() => StoreApiService(dio));
  getIt.registerLazySingleton<StoreRepo>(
      () => StoreRepo(getIt<StoreApiService>()));
  getIt.registerFactory<StoreCubit>(() => StoreCubit(getIt<StoreRepo>()));

  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt
      .registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeApiService>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  getIt
      .registerLazySingleton<ServicesApiService>(() => ServicesApiService(dio));
  getIt.registerLazySingleton<ServicesRepo>(
      () => ServicesRepo(getIt<ServicesApiService>()));
  getIt.registerFactory<ServicesCubit>(
      () => ServicesCubit(getIt<ServicesRepo>()));
}

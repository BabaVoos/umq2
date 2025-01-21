import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/networking/dio_factory.dart';
import 'core/networking/shared_pref.dart';
import 'core/routing/app_router.dart';
import 'umq.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();
  DioFactory.getDio();
  await SharedPrefService.init();
  await ScreenUtil.ensureScreenSize();

  runApp(UMQ(
    appRouter: AppRouter(),
  ));
}

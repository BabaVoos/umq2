import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/config/app_theme.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class UMQ extends StatelessWidget {
  final AppRouter appRouter;
  const UMQ({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'UMQ',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../features/home/models/get_trainers_response_model.dart';
import '../../features/store/models/get_products_response_mode.dart';
import '../../spalsh_screen.dart';
import '../di/dependency_injection.dart';
import '../../features/auth/ui/bloc/auth_cubit.dart';
import '../../features/auth/ui/screens/forget_password_screen.dart';
import '../../features/auth/ui/screens/login_screen.dart';
import '../../features/auth/ui/screens/sign_up_screen.dart';
import '../../features/auth/ui/screens/verify_screen.dart';
import '../../features/home/ui/screens/about_trainer_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/on_boarding/ui/screens/on_boarding_screen.dart';
import '../../features/cart/ui/screens/success_checkout_screen.dart';
import '../../features/notifications/ui/screens/notifications_screen.dart';
import '../../features/profile/ui/screens/edit_profile_screen.dart';
import '../../features/profile/ui/screens/profile_screen.dart';
import '../../features/store/ui/bloc/store_cubit.dart';
import '../../features/store/ui/screens/product_details_screen.dart';
import '../../features/store/ui/screens/store_screen.dart';
import '../../features/cart/ui/screens/cart_screen.dart';
import '../../features/cart/ui/screens/payment_screen.dart';
import '../../nav_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';


class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    // this arguments to be passed in any screen like this ( arguents as ClassName )
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );
      case Routes.verifyCodeScreen:
        return MaterialPageRoute(
          builder: (_) => const VerifyScreen(),
        );
      case Routes.navScreen:
        return MaterialPageRoute(
          builder: (_) => const NavScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.aboutTrainerScreen:
        return MaterialPageRoute(
          builder: (_) => AboutTrainerScreen(
            trainer: arguments as Trainer,
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<AuthCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case Routes.editProfielScreen:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationsScreen(),
        );
      case Routes.storeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<StoreCubit>(),
            child: const StoreScreen(),
          ),
        );
      case Routes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            product: arguments as GetProductsResponseModel,
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
        );
      case Routes.successCheckoutScreen:
        return MaterialPageRoute(
          builder: (_) => const SuccessCheckoutScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}

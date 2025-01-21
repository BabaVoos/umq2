import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/app_palette.dart';
import 'core/di/dependency_injection.dart';
import 'features/home/ui/bloc/home_cubit.dart';
import 'features/home/ui/screens/home_screen.dart';
import 'features/profile/ui/screens/profile_screen.dart';
import 'features/services/ui/screens/services_screen.dart';
import 'features/store/ui/bloc/store_cubit.dart';
import 'features/store/ui/screens/store_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    BlocProvider.value(
      value: getIt<HomeCubit>(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<StoreCubit>(),
      child: const StoreScreen(),
    ),
    const ServicesScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        child: BottomNavyBar(
          borderRadius: BorderRadius.circular(24),
          backgroundColor: const Color(0XFFD1D5DE),
          selectedIndex: currentIndex,
          showElevation: false,
          itemCornerRadius: 24,
          curve: Curves.fastLinearToSlowEaseIn,
          onItemSelected: (index) => setState(() => currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Center(child: Text('Home')),
              activeColor: AppPalette.primaryLight,
              inactiveColor: AppPalette.primaryLight,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.store),
              title: const Center(child: Text('Store')),
              activeColor: AppPalette.primaryLight,
              inactiveColor: AppPalette.primaryLight,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.directions_boat),
              title: const Center(child: Text('Services')),
              activeColor: AppPalette.primaryLight,
              inactiveColor: AppPalette.primaryLight,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Center(child: Text('Profile')),
              activeColor: AppPalette.primaryLight,
              inactiveColor: AppPalette.primaryLight,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}

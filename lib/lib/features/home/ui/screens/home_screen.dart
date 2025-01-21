import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/loading.dart';
import '../widgets/trainer_item.dart';
import '../bloc/home_cubit.dart';
import '../../../../core/config/app_palette.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getTrainers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppPalette.whiteColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mariam Mekhail',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  verticalSpacing(10),
                  Text(
                    'Cairo, Egypt',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppPalette.primaryLight,
                        ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.favorite, color: AppPalette.primaryLight),
              title: const Text('Favourite',
                  style: TextStyle(color: AppPalette.primaryLight)),
              onTap: () {
                // Handle the favourite action
                context.pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail,
                  color: AppPalette.primaryLight),
              title: const Text('Contact us',
                  style: TextStyle(color: AppPalette.primaryLight)),
              onTap: () {
                // Handle the contact us action
                context.pop();
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.language, color: AppPalette.primaryLight),
              title: const Text('Language',
                  style: TextStyle(color: AppPalette.primaryLight)),
              onTap: () {
                // Handle the language action
                context.pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: AppPalette.primaryLight),
              title: const Text('About us',
                  style: TextStyle(color: AppPalette.primaryLight)),
              onTap: () {
                // Handle the about us action
                context.pop();
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.settings, color: AppPalette.primaryLight),
              title: const Text('Settings',
                  style: TextStyle(color: AppPalette.primaryLight)),
              onTap: () {
                // Handle the settings action
                context.pop();
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.assignment, color: AppPalette.primaryLight),
              title: const Text('Terms',
                  style: TextStyle(color: AppPalette.primaryLight)),
              onTap: () {
                // Handle the terms action
                context.pop();
              },
            ),
            const Divider(),
            ListTile(
              leading:
                  const Icon(Icons.person_add, color: AppPalette.primaryLight),
              title: const Text('Become a Trainer',
                  style: TextStyle(color: AppPalette.primaryLight)),
              onTap: () {
                // Handle the become a trainer action
                context.pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Welcome to the depth',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppPalette.textPrimary,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                fillColor: AppPalette.whiteColor,
                prefixIcon: Icon(Icons.search),
                filled: true,
                hintText: 'search',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            verticalSpacing(20),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Loading();
                  } else if (state is HomeError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  } else if (state is GetTrainersSuccess) {
                    if (state.trainers.isEmpty) {
                      return const Center(
                        child: Text('No Trainers Available'),
                      );
                    }
                    return ListView.separated(
                      itemCount: state.trainers.length,
                      separatorBuilder: (context, index) => verticalSpacing(30),
                      itemBuilder: (context, index) => TrainerItem(
                        trainer: state.trainers[index],
                      ),
                    );
                  }
                  return const Center(
                    child: Text('No Trainers Available'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

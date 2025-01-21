import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile/profile_info.dart';
import '../../../../core/helpers/spacing.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileHeader(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6SGvshARHJ5GYSH_Kig8-cYNw5rO3nWn7mA&s',
            ),
            verticalSpacing(40),
            const ProfileInfo(),
          ],
        ),
      ),
    );
  }
}

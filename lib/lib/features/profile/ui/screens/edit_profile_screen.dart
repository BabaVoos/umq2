import 'package:flutter/material.dart';
import 'package:umq/lib/core/helpers/extensions.dart';
import '../widgets/edit_profile/edit_profile_form.dart';
import '../widgets/edit_profile/save_data_button.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/profile_header.dart';
import '../../../../core/config/app_palette.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.whiteColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6SGvshARHJ5GYSH_Kig8-cYNw5rO3nWn7mA&s',
                isEdit: true,
              ),
              verticalSpacing(60),
              const EditProfileForm(),
              verticalSpacing(30),
              SaveDataButton(
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

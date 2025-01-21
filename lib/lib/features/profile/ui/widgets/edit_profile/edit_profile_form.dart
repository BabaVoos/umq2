import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import 'edit_profile_text_field.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        child: Column(
          children: [
            EditProfileTextField(
              icon: Icons.email_outlined,
              controller: TextEditingController(
                text: 'mariammekhail59@gmail.com',
              ),
            ),
            verticalSpacing(20),
            EditProfileTextField(
              icon: Icons.phone_in_talk_rounded,
              controller: TextEditingController(
                text: '0123456789',
              ),
            ),
            verticalSpacing(20),
            EditProfileTextField(
              icon: Icons.location_on_outlined,
              controller: TextEditingController(
                text: 'Jeddah',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

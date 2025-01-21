import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/config/app_palette.dart';

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.icon,
    required this.controller,
  });

  final TextEditingController controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppPalette.primaryLight,
      style: Theme.of(context).textTheme.titleSmall,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: AppPalette.primaryLight,
        ),
        fillColor: AppPalette.whiteColor,
        filled: true,
        focusedBorder: _border,
        border: _border,
      ),
    );
  }

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          20.r,
        ),
        borderSide: const BorderSide(
          color: AppPalette.primaryLight,
        ),
      );
}

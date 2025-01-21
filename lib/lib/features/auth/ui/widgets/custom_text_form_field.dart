import 'package:flutter/material.dart';
import '../../../../core/config/app_palette.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.obscureText = false,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: AppPalette.textPrimaryLight),
      decoration: InputDecoration(
        errorStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppPalette.errorColor),
        labelText: labelText,
        labelStyle: const TextStyle(color: AppPalette.primaryLight),
        hintText: hintText,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppPalette.errorColor),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppPalette.primaryLight),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppPalette.primaryLight),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppPalette.primaryLight),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}

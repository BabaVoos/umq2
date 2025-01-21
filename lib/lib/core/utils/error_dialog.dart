import 'package:flutter/material.dart';
import '../config/app_palette.dart';

void showErrorDialog(BuildContext context,
        {required String content, required String title, required List<Widget> actions}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: AppPalette.background,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          content: Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: actions),
    );

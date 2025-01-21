import 'package:flutter/material.dart';

import '../widgets/loading.dart';

showLoading(context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        content: Loading(),
      ),
    );

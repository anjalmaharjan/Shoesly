import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

Future<dynamic> circularLoader(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.all(30),
        color: AppColors.backgroundColor,
        child: const CircularProgressIndicator.adaptive(),
      ),
    ),
  );
}

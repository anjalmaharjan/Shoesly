import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';

class TrashWidget extends StatelessWidget {
  const TrashWidget({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        decoration: BoxDecoration(
          color: AppColors.errorColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            bottomLeft: Radius.circular(22),
          ),
        ),
        child: SizedBox(
          height: 40,
          child: SvgPicture.asset(
            "assets/svgs/trash.svg",
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

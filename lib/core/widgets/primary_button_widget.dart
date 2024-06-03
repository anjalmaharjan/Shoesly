import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool iconRequired;
  final String text;
  final double height, width;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.iconRequired = false,
    required this.text,
    this.height = 40,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.black,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconRequired) ...[
            SvgPicture.asset(
              "assets/svgs/filter.svg",
            ),
            const SizedBox(width: 16),
          ],
          Text(
            text.toUpperCase(),
            style: const TextStyle(color: AppColors.backgroundColor),
          ),
        ],
      ),
    );
  }
}

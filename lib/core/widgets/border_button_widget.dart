import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/theme/app_colors.dart';
import 'package:shoesly/core/theme/font_manager.dart';

class BorderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool iconRequired;
  final String text;
  final double height;
  const BorderButton({
    super.key,
    required this.onPressed,
    this.iconRequired = false,
    required this.text,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          width: 1,
          color: AppColors.unselectedTextColor,
        ),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: height,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
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
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: FontSize.s16),
            ),
          ],
        ),
      ),
    );
  }
}

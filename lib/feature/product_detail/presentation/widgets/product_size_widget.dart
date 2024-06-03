import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/font_manager.dart';

class ProductSizeWidget extends StatelessWidget {
  const ProductSizeWidget({
    super.key,
    required this.size,
    required this.textTheme,
    required this.isSelected,
    required this.onTap,
  });

  final double size;
  final bool isSelected;

  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.selectedTextColor : null,
          border: Border.all(
            width: 1,
            color: isSelected
                ? AppColors.selectedTextColor
                : AppColors.unselectedTextColor,
          ),
        ),
        child: Center(
          child: Text(
            "$size",
            style: textTheme.titleLarge?.copyWith(
              fontSize: FontSize.s14,
              color: isSelected
                  ? AppColors.backgroundColor
                  : AppColors.unselectedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

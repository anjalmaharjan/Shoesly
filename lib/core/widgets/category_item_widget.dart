import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/font_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: isSelected
                  ? AppColors.selectedTextColor
                  : AppColors.unselectedTextColor,
              fontSize: FontSize.s20,
            ),
      ),
    );
  }
}

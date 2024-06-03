import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class FilterItemButton extends StatelessWidget {
  const FilterItemButton({
    super.key,
    required this.textTheme,
    this.isSelected = false,
    this.iconRequired = false,
    required this.text,
    required this.onPressed,
    this.color = AppColors.backgroundColor,
  });

  final TextTheme textTheme;
  final bool isSelected, iconRequired;
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      color: isSelected && !iconRequired ? AppColors.selectedTextColor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
        side: BorderSide(
          color: iconRequired && isSelected
              ? AppColors.selectedTextColor
              : AppColors.itemBackgroundColor,
        ),
      ),
      child: Row(
        children: [
          if (iconRequired)
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(color: AppColors.itemBackgroundColor),
              ),
            ),
          Text(
            text,
            style: textTheme.titleMedium?.copyWith(
              color: !isSelected
                  ? AppColors.selectedTextColor
                  : isSelected && iconRequired
                      ? AppColors.selectedTextColor
                      : AppColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}

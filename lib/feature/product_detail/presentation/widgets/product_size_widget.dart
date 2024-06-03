import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/font_manager.dart';
import '../../../../core/widgets/product_item_widget.dart';

class ProductSizeWidget extends StatelessWidget {
  const ProductSizeWidget({
    super.key,
    required this.product,
    required this.textTheme,
  });

  final ProductItemModel product;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < product.size!.length; i++)
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == 0 ? AppColors.selectedTextColor : null,
              border: Border.all(
                width: 1,
                color: i == 0
                    ? AppColors.selectedTextColor
                    : AppColors.unselectedTextColor,
              ),
            ),
            child: Center(
              child: Text(
                "${product.size?[i]}",
                style: textTheme.titleLarge?.copyWith(
                  fontSize: FontSize.s14,
                  color: i == 0
                      ? AppColors.backgroundColor
                      : AppColors.unselectedTextColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

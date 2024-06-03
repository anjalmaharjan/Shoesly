import 'package:flutter/material.dart';
import 'package:shoesly/core/widgets/border_button_widget.dart';
import 'package:shoesly/core/widgets/primary_button_widget.dart';
import '../theme/app_colors.dart';
import '../theme/font_manager.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    this.isleftButtonRequired = true,
    this.title = "Price",
    this.totalCost = '2550.0',
    required this.rightButtonText,
    required this.rightButtonOnPressed,
    this.leftButtonOnPressed,
    this.leftButtonText,
    this.isBoxShadowRequired = true,
  });
  final bool isleftButtonRequired;
  final String title, totalCost;
  final String rightButtonText;
  final String? leftButtonText;
  final VoidCallback rightButtonOnPressed;
  final VoidCallback? leftButtonOnPressed;
  final bool isBoxShadowRequired;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: isBoxShadowRequired
            ? [
                BoxShadow(
                  color: AppColors.unselectedTextColor.withOpacity(0.2),
                  spreadRadius: 8,
                  blurRadius: 8,
                  offset: const Offset(10, 0), // Shadow only on the right side
                )
              ]
            : null,
      ),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isleftButtonRequired) ...[
            Expanded(
              child: BorderButton(
                onPressed: leftButtonOnPressed ?? () {},
                text: leftButtonText ?? "",
                height: 50,
              ),
            ),
            const SizedBox(width: 15),
          ] else ...[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: FontSize.s12),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "\$$totalCost",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s20),
                  ),
                ],
              ),
            ),
          ],
          Expanded(
            child: PrimaryButton(
              height: 50,
              onPressed: rightButtonOnPressed,
              text: rightButtonText,
            ),
          )
        ],
      ),
    );
  }
}

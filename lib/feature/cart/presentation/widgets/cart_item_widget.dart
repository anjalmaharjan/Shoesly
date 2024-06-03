import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.textTheme,
    required this.productName,
    required this.brandName,
    required this.color,
    required this.size,
  });

  final TextTheme textTheme;

  final String productName, brandName, color, size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.itemBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 88,
            width: 88,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style:
                      textTheme.titleMedium?.copyWith(fontSize: FontSize.s16),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$brandName. ',
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.cartSubTextColor,
                        ),
                      ),
                      TextSpan(
                        text: '$color. ',
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.cartSubTextColor,
                        ),
                      ),
                      TextSpan(
                        text: '$size ',
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.cartSubTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "\$235.00",
                        style: textTheme.titleLarge
                            ?.copyWith(fontSize: FontSize.s14),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/svgs/minus_cirlce.svg",
                        ),
                      ),
                    ),
                    Text(
                      "1",
                      style: textTheme.titleLarge
                          ?.copyWith(fontSize: FontSize.s14),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/svgs/add-circle.svg"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

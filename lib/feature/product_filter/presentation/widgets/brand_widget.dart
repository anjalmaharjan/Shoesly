import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({
    super.key,
    required this.textTheme,
    this.isTickRequired = true,
  });

  final TextTheme textTheme;
  final bool isTickRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.itemBackgroundColor,
              ),
              child: SvgPicture.asset("assets/svgs/star.svg"),
            ),
            if (isTickRequired)
              Positioned(
                bottom: 8,
                right: 0,
                child: SvgPicture.asset(
                  "assets/svgs/tick_circle.svg",
                ),
              )
          ],
        ),
        Text(
          "Nike",
          style: textTheme.titleLarge?.copyWith(fontSize: FontSize.s14),
        ),
        Text(
          "100 items",
          style: textTheme.titleSmall,
        ),
      ],
    );
  }
}

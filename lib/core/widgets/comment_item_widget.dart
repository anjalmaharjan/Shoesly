import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/widgets/product_item_widget.dart';

import '../theme/app_colors.dart';
import '../theme/font_manager.dart';

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({
    super.key,
    required this.commentModel,
  });

  final ProductReviewModel? commentModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(30),
            child: Image.network(
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    commentModel?.name ?? "N/A",
                    style:
                        textTheme.titleMedium!.copyWith(fontSize: FontSize.s16),
                  ),
                  Text(
                    commentModel?.name ?? "Today",
                    style: textTheme.titleSmall!.copyWith(
                      fontSize: FontSize.s12,
                      color: AppColors.unselectedTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: SvgPicture.asset(
                        i != 0
                            ? "assets/svgs/star.svg"
                            : "assets/svgs/light_star.svg",
                        semanticsLabel: 'Star',
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                commentModel?.comment ??
                    "Perfect for keeping your feet dry and warm in damp conditions. ",
                style: textTheme.titleSmall!.copyWith(
                  height: 2,
                  fontSize: FontSize.s12,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

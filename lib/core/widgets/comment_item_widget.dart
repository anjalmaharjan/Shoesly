import 'package:flutter/material.dart';
import 'package:shoesly/core/product_model.dart';
import '../core.dart';

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({
    super.key,
    required this.commentModel,
  });

  final Review? commentModel;

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
                    "Today",
                    style: textTheme.titleSmall!.copyWith(
                      fontSize: FontSize.s12,
                      color: AppColors.unselectedTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              RatingStarWidget(rating: commentModel?.rating ?? 0),
              const SizedBox(height: 10),
              Text(
                commentModel?.description ?? "N/A ",
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

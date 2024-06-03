import 'package:flutter/widgets.dart';

import '../../../../core/product_model.dart';
import '../../../../core/widgets/comment_item_widget.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: product.review?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CommentItemWidget(
          commentModel: product.review?[index],
        );
      },
    );
  }
}

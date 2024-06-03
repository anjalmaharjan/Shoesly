import 'package:flutter/widgets.dart';

import '../../../../core/widgets/comment_item_widget.dart';
import '../../../../core/widgets/product_item_widget.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: product.reviewList?.length ?? 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CommentItemWidget(
          commentModel: product.reviewList?[index],
        );
      },
    );
  }
}

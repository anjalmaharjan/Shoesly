import 'package:flutter/widgets.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/product_item_widget.dart';

class ProductImageSliderWidget extends StatelessWidget {
  const ProductImageSliderWidget({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        height: 315,
        color: AppColors.itemBackgroundColor,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 178,
              child: Hero(
                tag: "${product.name}${product.id ?? 0}",
                child: Image.asset(
                  product.image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}

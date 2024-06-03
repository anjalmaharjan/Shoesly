import 'package:flutter/material.dart';
import '../../../../core/widgets/product_item_widget.dart';

class DiscoverPageTablet extends StatelessWidget {
  const DiscoverPageTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) => ListTile(
              title: Text("Product $index"),
            ),
          ),
        ),
        // Expanded(
        //   flex: 6,
        //   child: ProductItem(
        //     productList: DummyData.dummyProductList,
        //   ),
        // ),
      ],
    );
  }
}

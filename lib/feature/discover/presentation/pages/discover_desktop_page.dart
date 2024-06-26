import 'package:flutter/material.dart';

class DiscoverPageDesktop extends StatelessWidget {
  const DiscoverPageDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (context, index) => ListTile(
              title: Text("Product $index"),
            ),
          ),
        ),
        // ProductItem(
        //   productList: DummyData.dummyProductList,
        // ),
      ],
    );
  }
}

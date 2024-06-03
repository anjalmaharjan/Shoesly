import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class OrderDetailTile extends StatelessWidget {
  const OrderDetailTile({
    super.key,
    required this.textTheme,
    required this.title,
    required this.subTitle,
    required this.onTapTile,
    required this.price,
  });

  final TextTheme textTheme;
  final String title, subTitle, price;
  final VoidCallback onTapTile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style:
            textTheme.titleLarge?.copyWith(fontSize: FontSize.s14, height: 3),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subTitle,
            style: textTheme.titleSmall?.copyWith(fontSize: FontSize.s14),
          ),
          Text(
            "\$$price",
            style: textTheme.titleLarge?.copyWith(fontSize: FontSize.s14),
          ),
        ],
      ),
    );
  }
}

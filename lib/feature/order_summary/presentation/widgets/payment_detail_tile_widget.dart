import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class PaymentDetailTile extends StatelessWidget {
  const PaymentDetailTile({
    super.key,
    required this.textTheme,
    required this.title,
    required this.price,
  });

  final TextTheme textTheme;
  final String title, price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
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

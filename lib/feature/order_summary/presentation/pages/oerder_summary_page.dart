import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/responsive.dart';
import 'package:shoesly/core/theme/app_colors.dart';
import 'package:shoesly/core/theme/font_manager.dart';
import '../../../../core/widgets/custom_bottom_nav_bar_widget.dart';

class OrderSummaryPage extends StatefulWidget {
  const OrderSummaryPage({super.key});

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 30),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Order Summary",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Responsive(
        mobile: ListView(
          padding:
              const EdgeInsets.only(right: 30, left: 30, top: 30, bottom: 70),
          children: [
            Text(
              "Order Summary",
              style: textTheme.titleLarge?.copyWith(fontSize: FontSize.s18),
            ),
            const SizedBox(height: 20),
            InformationItem(
              textTheme: textTheme,
              title: "Payment Method",
              subTitle: "Credit Card",
              onTapTile: () {},
              onTapIcon: () {},
            ),
            const SizedBox(height: 10),
            Divider(color: AppColors.dividerColor),
            const SizedBox(height: 10),
            InformationItem(
              textTheme: textTheme,
              title: "Location",
              subTitle: "Kathmandu, Nepal",
              onTapTile: () {},
              onTapIcon: () {},
            ),
            const SizedBox(height: 30),
            Text(
              "Order Detail",
              style: textTheme.titleLarge?.copyWith(fontSize: FontSize.s18),
            ),
            OrderDetailTile(
              textTheme: textTheme,
              title: "Jordan 1 Retro High Tie Dye",
              subTitle: "Nike . Red Grey . 40 . Qty 1",
              price: "235.0",
              onTapTile: () {},
            ),
            OrderDetailTile(
              textTheme: textTheme,
              title: "Jordan 1 Retro High Tie Dye",
              subTitle: "Nike . Red Grey . 40 . Qty 1",
              price: "235.0",
              onTapTile: () {},
            ),
            OrderDetailTile(
              textTheme: textTheme,
              title: "Jordan 1 Retro High Tie Dye",
              subTitle: "Nike . Red Grey . 40 . Qty 1",
              price: "235.0",
              onTapTile: () {},
            ),
            const SizedBox(height: 30),
            Text(
              "Payment Detail",
              style: textTheme.titleLarge?.copyWith(fontSize: FontSize.s18),
            ),
            const SizedBox(height: 10),
            PaymentDetailTile(
              textTheme: textTheme,
              title: "Sub Total",
              price: "705.00",
            ),
            PaymentDetailTile(
              textTheme: textTheme,
              title: "Shipping",
              price: "705.00",
            ),
            Divider(color: AppColors.dividerColor),
            PaymentDetailTile(
              textTheme: textTheme,
              title: "Total Order",
              price: "705.00",
            ),
          ],
        ),
        tablet: const Column(),
        desktop: const Column(),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        rightButtonText: "payment",
        rightButtonOnPressed: () {},
        isleftButtonRequired: false,
        title: "Grand Total",
        totalCost: "705.00",
      ),
    );
  }
}

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

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
    required this.textTheme,
    required this.title,
    required this.subTitle,
    required this.onTapTile,
    required this.onTapIcon,
  });

  final TextTheme textTheme;
  final String title, subTitle;
  final VoidCallback onTapTile, onTapIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapTile,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style:
            textTheme.titleLarge?.copyWith(fontSize: FontSize.s14, height: 3),
      ),
      subtitle: Text(
        subTitle,
        style: textTheme.titleSmall?.copyWith(fontSize: FontSize.s14),
      ),
      trailing: IconButton(
        onPressed: onTapIcon,
        icon: SvgPicture.asset("assets/svgs/arrow_right.svg"),
      ),
    );
  }
}

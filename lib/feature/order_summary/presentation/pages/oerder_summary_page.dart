import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../widgets/information_item_widget.dart';
import '../widgets/order_detail_widget.dart';
import '../widgets/payment_detail_tile_widget.dart';

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
        rightButtonOnPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog.adaptive(
              titlePadding: const EdgeInsets.symmetric(vertical: 80),
              title: Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.selectedTextColor,
                ),
              ),
            ),
          );
        },
        isleftButtonRequired: false,
        title: "Grand Total",
        totalCost: "705.00",
      ),
    );
  }
}

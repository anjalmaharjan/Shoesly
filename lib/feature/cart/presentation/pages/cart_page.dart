import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/core.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/trash_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    // ...add more items
  ];
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
          "Cart",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Responsive(
        mobile: ListView.separated(
          padding: const EdgeInsets.only(top: 30, bottom: 50),
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              key: ValueKey<int>(items[index].hashCode),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.2,
                children: [
                  Expanded(
                    flex: 1,
                    child: TrashWidget(
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              child: CartItemWidget(
                textTheme: textTheme,
                productName: 'Jordan 1 Retro High Tie Dye',
                brandName: 'Nike',
                color: 'Grey',
                size: '45',
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 30),
          itemCount: items.length,
        ),
        tablet: const Row(),
        desktop: const Row(),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        rightButtonText: "checkout",
        rightButtonOnPressed: () {
          Navigator.pushNamed(context, AppRoutes.orderSummary);
        },
        isleftButtonRequired: false,
        title: "Grand Total",
        totalCost: "705.00",
      ),
    );
  }
}

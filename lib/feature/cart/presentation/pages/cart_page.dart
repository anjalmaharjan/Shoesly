import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoesly/feature/cart/presentation/cubit/cart_cubit.dart';
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
        mobile: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartList = state.cartProductList ?? [];
            return ListView.separated(
              padding: const EdgeInsets.only(top: 30, bottom: 50),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return cartList.isEmpty
                    ? Center(
                        child: Text(
                          "Nothing in list",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : Slidable(
                        key: ValueKey<int>(
                            state.cartProductList![index].hashCode),
                        closeOnScroll: true,
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.2,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TrashWidget(
                                onPressed: () {
                                  context
                                      .read<CartCubit>()
                                      .removeFromCartList(index);
                                },
                              ),
                            ),
                          ],
                        ),
                        child: CartItemWidget(
                          textTheme: textTheme,
                          productModel: state.cartProductList![index],
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 30),
              itemCount:
                  cartList.isEmpty ? 1 : state.cartProductList?.length ?? 0,
            );
          },
        ),
        tablet: const Row(),
        desktop: const Row(),
      ),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return CustomBottomNavBar(
            rightButtonText: "checkout",
            rightButtonOnPressed: () {
              Navigator.pushNamed(context, AppRoutes.orderSummary,
                  arguments: state.cartProductList);
            },
            isleftButtonRequired: false,
            title: "Grand Total",
            totalCost: (state.totalPrice ?? 0.0).toString(),
          );
        },
      ),
    );
  }
}

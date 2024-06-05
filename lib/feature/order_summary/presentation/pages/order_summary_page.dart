import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shoesly/core/network/connection_checker.dart';
import 'package:shoesly/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:shoesly/feature/order_summary/data/datasources/order_summary_remote_data_source.dart';
import 'package:shoesly/feature/order_summary/data/models/payment_model.dart';
import 'package:shoesly/feature/order_summary/data/repository/order_summary_repostiory_impl.dart';
import 'package:shoesly/feature/order_summary/domain/usecases/order_summary_usecase.dart';
import 'package:shoesly/feature/order_summary/presentation/cubit/order_summary_cubit.dart';
import '../../../../core/core.dart';
import '../../../../core/enum/enum.dart';
import '../../../../core/widgets/loader.dart';
import '../../../discover/data/models/product_model.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final arguments =
        ModalRoute.of(context)?.settings.arguments as List<ProductModel>;
    return BlocProvider(
      create: (context) => OrderSummaryCubit(
        orderSummaryUsecase: OrderSummaryUsecase(
          OrderSummaryRepositoryImpl(
            OrderSummaryRemoteDataSourceImpl(FirebaseDatabase.instance),
            ConnectionCheckerImpl(
              InternetConnection(),
            ),
          ),
        ),
      )
        ..totalShippingCost(arguments)
        ..subTotalCost(arguments)
        ..grandTotal(arguments),
      child: BlocListener<OrderSummaryCubit, OrderSummaryState>(
        listener: (context, state) {
          if (state.apiRequestStates == ApiRequestStates.loading) {
            circularLoader(context);
          } else if (state.apiRequestStates == ApiRequestStates.success) {
            BlocProvider.of<CartCubit>(context).clearCart();
            Future.delayed(const Duration(seconds: 3), () {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.selectedTextColor,
                    content: Text(
                      "Congratulations!",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.backgroundColor,
                            fontSize: FontSize.s20,
                          ),
                    ),
                  ),
                );
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.discover,
                (route) => false,
              );
            });
          }
        },
        child: Scaffold(
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
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 30, bottom: 70),
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
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.cartProductList?.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return OrderDetailTile(
                          textTheme: textTheme,
                          title: state.cartProductList?[index].name ?? "N/A",
                          subTitle:
                              "${state.cartProductList?[index].brand} . Red . ${state.cartProductList?[index].selectedSize ?? 39} . Qty ${state.cartProductList?[index].cartQuantity ?? 0}",
                          price:
                              "${(state.cartProductList?[index].price ?? 0) * (state.cartProductList?[index].cartQuantity ?? 0)}",
                          onTapTile: () {},
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  "Payment Detail",
                  style: textTheme.titleLarge?.copyWith(fontSize: FontSize.s18),
                ),
                const SizedBox(height: 10),
                BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        PaymentDetailTile(
                          textTheme: textTheme,
                          title: "Sub Total",
                          price: "${state.subTotalCost}",
                        ),
                        PaymentDetailTile(
                          textTheme: textTheme,
                          title: "Shipping",
                          price: "${state.totalShippingCost}",
                        ),
                        Divider(color: AppColors.dividerColor),
                        PaymentDetailTile(
                          textTheme: textTheme,
                          title: "Total Cost",
                          price: "${state.totalOrderCost}",
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            tablet: const Column(),
            desktop: const Column(),
          ),
          bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              return BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
                builder: (context, ordreSummaryState) {
                  return CustomBottomNavBar(
                    rightButtonText: "payment",
                    rightButtonOnPressed: () {
                      context.read<OrderSummaryCubit>().postPaymentToDb(
                            PaymentModel(
                              productList: cartState.cartProductList,
                              subTotal: ordreSummaryState.subTotalCost,
                              grandTotal: ordreSummaryState.totalOrderCost,
                              shipping: ordreSummaryState.totalShippingCost,
                            ),
                          );
                    },
                    isleftButtonRequired: false,
                    title: "Grand Total",
                    totalCost: "${ordreSummaryState.totalOrderCost}",
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/feature/cart/presentation/cubit/cart_cubit.dart';

import '../../../../core/core.dart';
import '../../../discover/data/models/product_model.dart';
import '../cubit/product_detail_cubit.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
    required this.isAddedToCard,
    required this.product,
  });

  final bool isAddedToCard;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: !isAddedToCard
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.itemBackgroundColor,
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add to cart",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: FontSize.s20),
                          ),
                          IconButton(
                            constraints: const BoxConstraints(),
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset("assets/svgs/cross.svg"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Quantity",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: FontSize.s14),
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<ProductDetailCubit, ProductDetailState>(
                        builder: (context, state) {
                          final productCubit =
                              context.read<ProductDetailCubit>();
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 6,
                                child: TextFormField(
                                  controller: productCubit.quantityController
                                    ..text = state.quantity.toString(),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "1",
                                    border: InputBorder.none,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                              Flexible(
                                child: IconButton(
                                  onPressed: () {
                                    productCubit.decrementQuantity(
                                      int.parse(
                                        productCubit.quantityController.text,
                                      ),
                                      product.price ?? 0.0,
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/svgs/minus_cirlce.svg",
                                  ),
                                ),
                              ),
                              Flexible(
                                child: IconButton(
                                  onPressed: () {
                                    productCubit.incrementQuantity(
                                      int.parse(
                                          productCubit.quantityController.text),
                                      product.price ?? 0.0,
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                      "assets/svgs/add-circle.svg"),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      Divider(color: AppColors.selectedTextColor),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<ProductDetailCubit, ProductDetailState>(
                  builder: (context, state) {
                    return CustomBottomNavBar(
                      totalCost: state.totalPrice == 0.0
                          ? product.price.toString()
                          : state.totalPrice.toString(),
                      isleftButtonRequired: false,
                      title: "Total Price",
                      rightButtonText: "add to cart",
                      rightButtonOnPressed: () {
                        context.read<ProductDetailCubit>().isCartAdded(true);
                        BlocProvider.of<CartCubit>(context).addToCartList(
                          ProductModel(
                            id: product.id,
                            price: product.price,
                            brand: product.brand,
                            rating: product.rating,
                            brandLogo: product.brand,
                            cartQuantity: state.quantity,
                            description: product.description,
                            image: product.image,
                            name: product.name,
                            review: product.review,
                            size: product.size,
                            totalPrice: state.totalPrice,
                            selectedSize: product.selectedSize,
                            shippingCost: product.shippingCost,
                          ),
                        );
                      },
                      isBoxShadowRequired: false,
                    );
                  },
                )
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                SvgPicture.asset("assets/svgs/tick-circle.svg"),
                const SizedBox(height: 20),
                Text(
                  "Added to cart",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: FontSize.s24),
                ),
                const SizedBox(height: 10),
                BlocBuilder<ProductDetailCubit, ProductDetailState>(
                  builder: (context, state) {
                    return Text(
                      "${state.quantity} item total",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: FontSize.s14),
                    );
                  },
                ),
                const SizedBox(height: 10),
                BlocBuilder<ProductDetailCubit, ProductDetailState>(
                  builder: (context, state) {
                    return CustomBottomNavBar(
                      leftButtonText: "back explore",
                      leftButtonOnPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.discover, (route) => false);
                        context.read<ProductDetailCubit>().isCartAdded(false);
                      },
                      isleftButtonRequired: true,
                      title: "Total Price",
                      rightButtonText: "to cart",
                      rightButtonOnPressed: () async {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AppRoutes.cart);
                      },
                      isBoxShadowRequired: false,
                    );
                  },
                )
              ],
            ),
    );
  }
}

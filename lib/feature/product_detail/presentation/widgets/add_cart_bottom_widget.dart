import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../cubit/product_detail_cubit.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
    required this.isAddedToCard,
  });

  final bool isAddedToCard;

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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 6,
                            child: TextFormField(
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
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/svgs/minus_cirlce.svg",
                              ),
                            ),
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  "assets/svgs/add-circle.svg"),
                            ),
                          ),
                        ],
                      ),
                      Divider(color: AppColors.selectedTextColor),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                CustomBottomNavBar(
                  isleftButtonRequired: false,
                  title: "Total Price",
                  rightButtonText: "add to cart",
                  rightButtonOnPressed: () {
                    context.read<ProductDetailCubit>().addToCart(true);
                  },
                  isBoxShadowRequired: false,
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
                Text(
                  "1 item total",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: FontSize.s14),
                ),
                const SizedBox(height: 10),
                CustomBottomNavBar(
                  leftButtonText: "back explore",
                  leftButtonOnPressed: () {},
                  isleftButtonRequired: true,
                  title: "Total Price",
                  rightButtonText: "to cart",
                  rightButtonOnPressed: () async {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.cart);
                  },
                  isBoxShadowRequired: false,
                )
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/feature/discover/data/models/product_model.dart';
import 'package:shoesly/feature/cart/presentation/cubit/cart_cubit.dart';

import '../../../../core/core.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.textTheme,
    required this.productModel,
  });

  final TextTheme textTheme;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.itemBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 88,
            width: 88,
            child: Image.network(productModel.image ?? ''),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name ?? "N/A",
                  style:
                      textTheme.titleMedium?.copyWith(fontSize: FontSize.s16),
                ),
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${productModel.brand}',
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.cartSubTextColor,
                        ),
                      ),
                      TextSpan(
                        text: "${productModel.name}",
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.cartSubTextColor,
                        ),
                      ),
                      TextSpan(
                        text: "${productModel.name}",
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.cartSubTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "\$${"${(productModel.price ?? 0) * (productModel.cartQuantity ?? 0)}"}",
                            style: textTheme.titleLarge
                                ?.copyWith(fontSize: FontSize.s14),
                          ),
                        ),
                        Flexible(
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .decrementQuantity(productModel);
                            },
                            icon: SvgPicture.asset(
                              "assets/svgs/minus_cirlce.svg",
                            ),
                          ),
                        ),
                        Text(
                          "${productModel.cartQuantity}",
                          style: textTheme.titleLarge
                              ?.copyWith(fontSize: FontSize.s14),
                        ),
                        Flexible(
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .incrementQuantity(productModel);
                            },
                            icon:
                                SvgPicture.asset("assets/svgs/add-circle.svg"),
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

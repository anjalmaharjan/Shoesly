import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/feature/product_detail/presentation/cubit/product_detail_cubit.dart';

import '../../../../core/core.dart';
import '../widgets/add_cart_bottom_widget.dart';
import '../widgets/product_image_slider_widget.dart';
import '../widgets/product_review_list_widget.dart';
import '../widgets/product_size_list_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final product =
        ModalRoute.of(context)?.settings.arguments as ProductItemModel;
    return Scaffold(
      appBar: AppBar(),
      body: Responsive(
        mobile: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
          children: [
            ProductImageSliderWidget(product: product),
            const SizedBox(height: 30),
            Text(
              product.name ?? "N/A",
              style: textTheme.titleLarge!.copyWith(fontSize: FontSize.s20),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 30),
              child: Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: SvgPicture.asset(
                        i != product.rating
                            ? "assets/svgs/star.svg"
                            : "assets/svgs/light_star.svg",
                        semanticsLabel: 'Star',
                      ),
                    ),
                  RichText(
                    text: TextSpan(
                      text: '',
                      children: [
                        TextSpan(
                          text: '${product.rating ?? "N/A"}  ',
                          style: textTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: '(${product.reviewCount ?? "No"} Reviews)',
                          style: textTheme.titleSmall!.copyWith(
                            color: AppColors.unselectedTextColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Size",
              style: textTheme.titleMedium!.copyWith(fontSize: FontSize.s16),
            ),
            const SizedBox(height: 10),
            ProductSizeListWidget(product: product, textTheme: textTheme),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Description",
              style: textTheme.titleMedium!.copyWith(fontSize: FontSize.s16),
            ),
            const SizedBox(height: 10),
            Text(
              "${product.descrption}",
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            Text(
              "Review (${product.reviewCount})",
              style: textTheme.titleMedium!.copyWith(fontSize: FontSize.s16),
            ),
            const SizedBox(height: 10),
            ReviewListWidget(product: product),
            const SizedBox(height: 30),
            BorderButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.productReview);
              },
              text: "see all review",
              height: 50,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        tablet: const Column(),
        desktop: const Column(),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        isleftButtonRequired: false,
        rightButtonText: "add to cart",
        rightButtonOnPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColors.backgroundColor,
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return BlocBuilder<ProductDetailCubit, ProductDetailState>(
                builder: (context, state) {
                  return AddToCartWidget(isAddedToCard: state.addedToCart);
                },
              );
            },
          ).then((_) => context.read<ProductDetailCubit>().addToCart(false));
        },
        totalCost: "255.00",
      ),
    );
  }
}

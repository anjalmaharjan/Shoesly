import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/feature/discover/data/models/product_model.dart';
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
    final product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(),
      body: Responsive(
        mobile: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
          children: [
            ProductImageSliderWidget(
              product: product,
            ),
            const SizedBox(height: 30),
            Text(
              product.name ?? "N/A",
              style: textTheme.titleLarge!.copyWith(
                fontSize: FontSize.s20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 6, 0, 30),
              child: Row(
                children: [
                  RatingStarWidget(rating: product.rating ?? 0),
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
                          text: '(${product.review?.length ?? "No"} Reviews)',
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
              "${product.description}",
              style: textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            Text(
              "Review (${product.review?.length})",
              style: textTheme.titleMedium!.copyWith(fontSize: FontSize.s16),
            ),
            const SizedBox(height: 10),
            ReviewListWidget(product: product),
            const SizedBox(height: 30),
            BorderButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.productReview,
                    arguments: product);
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
              context.read<ProductDetailCubit>().resetQuantityAndTotalPrice();
              return BlocBuilder<ProductDetailCubit, ProductDetailState>(
                builder: (context, state) {
                  return AddToCartWidget(
                    isAddedToCard: state.addedToCart,
                    product: product,
                  );
                },
              );
            },
          ).then((_) => context.read<ProductDetailCubit>().isCartAdded(false));
        },
        totalCost: product.price.toString(),
      ),
    );
  }
}

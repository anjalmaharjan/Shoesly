import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';
import '../widgets/product_image_slider_widget.dart';
import '../widgets/product_review_list_widget.dart';
import '../widgets/product_size_widget.dart';

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
            const SizedBox(
              height: 10,
            ),
            ProductSizeWidget(product: product, textTheme: textTheme),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Description",
              style: textTheme.titleMedium!.copyWith(fontSize: FontSize.s16),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Description Description Description Description Description Description Description Description DescriptionDescription Description DescriptionDescription Description Description",
              style: textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Review (${product.reviewCount})",
              style: textTheme.titleMedium!.copyWith(fontSize: FontSize.s16),
            ),
            const SizedBox(
              height: 10,
            ),
            ReviewListWidget(product: product),
            const SizedBox(
              height: 30,
            ),
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
          customBottomSheet(context);
        },
        totalCost: "255.00",
      ),
    );
  }
}

Future<dynamic> customBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: AppColors.backgroundColor,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: MediaQuery.of(context).viewInsets,
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
        ),
        child: Column(
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
                          icon: SvgPicture.asset("assets/svgs/add-circle.svg"),
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
                Navigator.pushNamed(context, AppRoutes.cart);
              },
              isBoxShadowRequired: false,
            )
          ],
        ),
      );
    },
  );
}

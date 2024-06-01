import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/responsive.dart';
import 'package:shoesly/core/routes.dart';
import 'package:shoesly/core/theme/font_manager.dart';
import 'package:shoesly/feature/discover/presentation/widgets/border_button_widget.dart';
import 'package:shoesly/feature/discover/presentation/widgets/product_item_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../discover/presentation/widgets/primary_button_widget.dart';

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
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                height: 315,
                color: AppColors.itemBackgroundColor,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 178,
                      child: Hero(
                        tag: "${product.name}${product.id ?? 0}",
                        child: Image.asset(
                          product.image ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
            Row(
              children: [
                for (int i = 0; i < product.size!.length; i++)
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == 0 ? AppColors.selectedTextColor : null,
                      border: Border.all(
                        width: 1,
                        color: i == 0
                            ? AppColors.selectedTextColor
                            : AppColors.unselectedTextColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "${product.size?[i]}",
                        style: textTheme.titleLarge?.copyWith(
                          fontSize: FontSize.s14,
                          color: i == 0
                              ? AppColors.backgroundColor
                              : AppColors.unselectedTextColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
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
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 30),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: product.reviewList?.length ?? 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CommentItemWidget(
                  commentModel: product.reviewList?[index],
                );
              },
            ),
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
          showModalBottomSheet(
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
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, right: 30),
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
                      rightButtonOnPressed: () {},
                      isBoxShadowRequired: false,
                    )
                  ],
                ),
              );
            },
          );
        },
        totalCost: "255.00",
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    this.isleftButtonRequired = true,
    this.title = "Price",
    this.totalCost = '2550.0',
    required this.rightButtonText,
    required this.rightButtonOnPressed,
    this.leftButtonOnPressed,
    this.leftButtonText,
    this.isBoxShadowRequired = true,
  });
  final bool isleftButtonRequired;
  final String title, totalCost;
  final String rightButtonText;
  final String? leftButtonText;
  final VoidCallback rightButtonOnPressed;
  final VoidCallback? leftButtonOnPressed;
  final bool isBoxShadowRequired;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: isBoxShadowRequired
            ? [
                BoxShadow(
                  color: AppColors.unselectedTextColor.withOpacity(0.2),
                  spreadRadius: 8,
                  blurRadius: 8,
                  offset: const Offset(10, 0), // Shadow only on the right side
                )
              ]
            : null,
      ),
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isleftButtonRequired) ...[
            Expanded(
              child: BorderButton(
                onPressed: leftButtonOnPressed ?? () {},
                text: leftButtonText ?? "",
                height: 50,
              ),
            ),
            const SizedBox(width: 15),
          ] else ...[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: FontSize.s12),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "\$$totalCost",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: FontSize.s20),
                  ),
                ],
              ),
            ),
          ],
          Expanded(
            child: PrimaryButton(
              height: 50,
              onPressed: rightButtonOnPressed,
              text: rightButtonText,
            ),
          )
        ],
      ),
    );
  }
}

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({
    super.key,
    required this.commentModel,
  });

  final ProductReviewModel? commentModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(30),
            child: Image.network(
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    commentModel?.name ?? "N/A",
                    style:
                        textTheme.titleMedium!.copyWith(fontSize: FontSize.s16),
                  ),
                  Text(
                    commentModel?.name ?? "Today",
                    style: textTheme.titleSmall!.copyWith(
                      fontSize: FontSize.s12,
                      color: AppColors.unselectedTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: SvgPicture.asset(
                        i != 0
                            ? "assets/svgs/star.svg"
                            : "assets/svgs/light_star.svg",
                        semanticsLabel: 'Star',
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                commentModel?.comment ??
                    "Perfect for keeping your feet dry and warm in damp conditions. ",
                style: textTheme.titleSmall!.copyWith(
                  height: 2,
                  fontSize: FontSize.s12,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

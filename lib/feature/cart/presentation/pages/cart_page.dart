import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/responsive.dart';
import 'package:shoesly/core/routes.dart';
import 'package:shoesly/core/theme/app_colors.dart';
import 'package:shoesly/core/theme/font_manager.dart';
import 'package:shoesly/feature/product_detail/presentation/pages/product_detail_page.dart';

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
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        decoration: BoxDecoration(
                          color: AppColors.errorColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(22),
                            bottomLeft: Radius.circular(22),
                          ),
                        ),
                        child: SizedBox(
                          height: 40,
                          child: SvgPicture.asset(
                            "assets/svgs/trash.svg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              child: Padding(
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
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jordan 1 Retro High Tie Dye",
                            style: textTheme.titleMedium
                                ?.copyWith(fontSize: FontSize.s16),
                          ),
                          const SizedBox(height: 6),
                          RichText(
                            text: TextSpan(
                              text: '',
                              children: [
                                TextSpan(
                                  text: 'Nike. ',
                                  style: textTheme.titleSmall!.copyWith(
                                    color: AppColors.cartSubTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Red Grey. ',
                                  style: textTheme.titleSmall!.copyWith(
                                    color: AppColors.cartSubTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '40 ',
                                  style: textTheme.titleSmall!.copyWith(
                                    color: AppColors.cartSubTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "\$235.00",
                                  style: textTheme.titleLarge
                                      ?.copyWith(fontSize: FontSize.s14),
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
                              Text(
                                "1",
                                style: textTheme.titleLarge
                                    ?.copyWith(fontSize: FontSize.s14),
                              ),
                              Flexible(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/svgs/add-circle.svg"),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
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

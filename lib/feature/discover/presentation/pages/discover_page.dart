import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/responsive.dart';
import 'package:shoesly/core/routes.dart';
import 'package:shoesly/core/theme/app_colors.dart';
import 'package:shoesly/core/theme/font_manager.dart';
import 'package:shoesly/core/utlis/dummy_data.dart';
import 'package:shoesly/feature/discover/presentation/cubit/discover_cubit.dart';
import 'package:shoesly/feature/discover/presentation/widgets/primary_button_widget.dart';
import '../widgets/product_item_widget.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Responsive.isMobile(context)
          ? AnimatedSlide(
              offset: _showFab ? Offset.zero : const Offset(0, 2),
              duration: duration,
              child: AnimatedOpacity(
                duration: duration,
                opacity: _showFab ? 1 : 0,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 130),
                  child: PrimaryButton(
                    text: "filter",
                    iconRequired: true,
                    onPressed: () async {
                      Navigator.pushNamed(context, AppRoutes.productFilter);
                      // await FirebaseDatabaseService().getRequests();
                    },
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            setState(
              () {
                if (direction == ScrollDirection.reverse &&
                    notification.metrics.axis != Axis.horizontal) {
                  _showFab = false;
                } else if (direction == ScrollDirection.forward &&
                    notification.metrics.axis != Axis.horizontal) {
                  _showFab = true;
                } else {
                  _showFab = true;
                }
              },
            );
            return true;
          },
          child: Responsive(
            desktop: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) => ListTile(
                      title: Text("Product $index"),
                    ),
                  ),
                ),
                ProductItem(
                  productList: DummyData.dummyProductList,
                ),
              ],
            ),
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discover",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.cart);
                        },
                        icon: Stack(
                          children: [
                            SvgPicture.asset("assets/svgs/bag.svg"),
                            Positioned(
                              right: 0,
                              top: 3,
                              child: SvgPicture.asset("assets/svgs/dot.svg"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<DiscoverCubit, DiscoverState>(
                  builder: (context, state) {
                    return Expanded(
                      flex: 3,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 14),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CategoryItem(
                          isSelected: index == state.categoryIndex,
                          text: DummyData.categoryList[index],
                          onPressed: () {
                            context.read<DiscoverCubit>().selectCategory(index);
                          },
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 4),
                        itemCount: DummyData.categoryList.length,
                      ),
                    );
                  },
                ),
                Flexible(
                  flex: 40,
                  child: ProductItem(
                    productList: DummyData.dummyProductList,
                  ),
                ),
              ],
            ),
            tablet: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) => ListTile(
                      title: Text("Product $index"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: ProductItem(
                    productList: DummyData.dummyProductList,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: isSelected
                  ? AppColors.selectedTextColor
                  : AppColors.unselectedTextColor,
              fontSize: FontSize.s20,
            ),
      ),
    );
  }
}

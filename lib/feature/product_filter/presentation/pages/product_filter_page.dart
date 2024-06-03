import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/extensions/string_extension.dart';
import 'package:shoesly/core/responsive.dart';
import 'package:shoesly/core/theme/app_colors.dart';
import 'package:shoesly/core/theme/font_manager.dart';
import 'package:shoesly/core/utlis/filter_constants.dart';
import 'package:shoesly/feature/product_filter/presentation/cubit/filter_cubit.dart';
import '../../../product_detail/presentation/pages/product_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFilterPage extends StatefulWidget {
  const ProductFilterPage({super.key});

  @override
  State<ProductFilterPage> createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  // SfRangeValues _values = const SfRangeValues(40.0, 80.0);
  RangeValues values = const RangeValues(0.0, 2000);
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
          "Filter",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: BlocProvider(
        create: (context) => FilterCubit(),
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            return Responsive(
              mobile: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 30, top: 30, bottom: 70),
                children: [
                  Text(
                    "Brands",
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 40),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<FilterCubit>().brandPress(index);
                          },
                          child: BrandWidget(
                            textTheme: textTheme,
                            isTickRequired: index == state.brandIndex,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 30),
                      itemCount: FilterConstants.brandList.length,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Price Range",
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: RangeSlider(
                        min: 0,
                        max: 2000,
                        values: values,
                        onChanged: (newValues) {
                          setState(() {
                            values = newValues;
                          });
                        },
                        activeColor: AppColors.selectedTextColor,
                        divisions: 3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sort By",
                          style: textTheme.titleMedium,
                        ),
                        Text(
                          "Sort By",
                          style: textTheme.titleMedium,
                        ),
                        Text(
                          "Sort By",
                          style: textTheme.titleMedium,
                        ),
                        Text(
                          "Sort By",
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Sort By",
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 40),
                      itemBuilder: (context, index) {
                        return FilterButton(
                          textTheme: textTheme,
                          text: FilterConstants.sortByList[index],
                          onPressed: () {
                            context
                                .read<FilterCubit>()
                                .sortByFilterPress(index);
                          },
                          isSelected: index == state.sortByIndex,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: FilterConstants.sortByList.length,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Gender",
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 40),
                      itemBuilder: (context, index) {
                        final gender = Gender.values[index];
                        final selectedIndex = gender.index;
                        final text = gender.name.capitalizeFirst();
                        return FilterButton(
                          textTheme: textTheme,
                          isSelected: state.genderIndex == index,
                          text: text,
                          onPressed: () {
                            context
                                .read<FilterCubit>()
                                .genderPress(selectedIndex);
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: Gender.values.length,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Color",
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 40),
                      itemBuilder: (context, index) {
                        return FilterButton(
                          color: FilterConstants.shoesColor[index]['color'],
                          iconRequired: true,
                          textTheme: textTheme,
                          isSelected: state.colorIndex == index,
                          text: FilterConstants.shoesColor[index]['name'],
                          onPressed: () {
                            context.read<FilterCubit>().colorPress(index);
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: FilterConstants.shoesColor.length,
                    ),
                  ),
                ],
              ),
              tablet: const Column(),
              desktop: const Column(),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        isleftButtonRequired: true,
        rightButtonText: "add to cart",
        leftButtonText: "Reset",
        leftButtonOnPressed: () {},
        rightButtonOnPressed: () {},
      ),
    );
  }
}

class BrandWidget extends StatelessWidget {
  const BrandWidget({
    super.key,
    required this.textTheme,
    this.isTickRequired = true,
  });

  final TextTheme textTheme;
  final bool isTickRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.itemBackgroundColor,
              ),
              child: SvgPicture.asset("assets/svgs/star.svg"),
            ),
            if (isTickRequired)
              Positioned(
                bottom: 8,
                right: 0,
                child: SvgPicture.asset(
                  "assets/svgs/tick_circle.svg",
                ),
              )
          ],
        ),
        Text(
          "Nike",
          style: textTheme.titleLarge?.copyWith(fontSize: FontSize.s14),
        ),
        Text(
          "100 items",
          style: textTheme.titleSmall,
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.textTheme,
    this.isSelected = false,
    this.iconRequired = false,
    required this.text,
    required this.onPressed,
    this.color = AppColors.backgroundColor,
  });

  final TextTheme textTheme;
  final bool isSelected, iconRequired;
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      color: isSelected ? AppColors.selectedTextColor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
        side: BorderSide(
          color: AppColors.itemBackgroundColor,
        ),
      ),
      child: Row(
        children: [
          if (iconRequired)
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(color: AppColors.itemBackgroundColor),
              ),
            ),
          Text(
            text,
            style: textTheme.titleMedium?.copyWith(
              color: !isSelected
                  ? AppColors.selectedTextColor
                  : AppColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}

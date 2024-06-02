import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/responsive.dart';
import 'package:shoesly/core/theme/app_colors.dart';
import 'package:shoesly/core/theme/font_manager.dart';
import '../../../product_detail/presentation/pages/product_detail_page.dart';

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
      body: Responsive(
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
                        style: textTheme.titleLarge
                            ?.copyWith(fontSize: FontSize.s14),
                      ),
                      Text(
                        "100 items",
                        style: textTheme.titleSmall,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 30),
                itemCount: 10,
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
                  // labels: labels,
                  onChanged: (newValues) {
                    print(newValues);
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
                    text: 'test',
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10,
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
                  return FilterButton(
                    textTheme: textTheme,
                    text: 'teste',
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10,
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
                    iconRequired: true,
                    textTheme: textTheme,
                    text: 'testtte',
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10,
              ),
            ),
          ],
        ),
        tablet: const Column(),
        desktop: const Column(),
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

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.textTheme,
    this.isSelected = false,
    this.iconRequired = false,
    required this.text,
  });

  final TextTheme textTheme;
  final bool isSelected, iconRequired;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
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
                color: AppColors.errorColor,
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

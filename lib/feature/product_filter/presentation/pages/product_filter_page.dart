import 'package:flutter/material.dart';
import 'package:shoesly/feature/product_filter/presentation/cubit/filter_cubit.dart';
import '../../../../core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/filter_brand_widget.dart';
import '../widgets/filter_color_widget.dart';
import '../widgets/filter_gender_widget.dart';
import '../widgets/filter_sort_by_widget.dart';

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
                  BrandFilterWidget(
                    textTheme: textTheme,
                    selectedIndex: state.brandIndex,
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
                  SortByFilterWidget(
                    textTheme: textTheme,
                    selectedIndex: state.sortByIndex,
                  ),
                  const SizedBox(height: 30),
                  GenderFilterWidget(
                    textTheme: textTheme,
                    selectedIndex: state.genderIndex,
                  ),
                  const SizedBox(height: 30),
                  ColorFilterWidget(
                      textTheme: textTheme, selectedIndex: state.colorIndex),
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
        rightButtonText: "apply",
        leftButtonText: "Reset",
        leftButtonOnPressed: () {},
        rightButtonOnPressed: () {},
      ),
    );
  }
}

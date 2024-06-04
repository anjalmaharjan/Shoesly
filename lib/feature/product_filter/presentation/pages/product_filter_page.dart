import 'package:flutter/material.dart';
import 'package:shoesly/core/product_model.dart';
import 'package:shoesly/core/singletons/product_list_singleton.dart';
import 'package:shoesly/feature/discover/presentation/cubit/discover_cubit.dart';
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
  RangeValues _currentRangeValues = const RangeValues(0, 2000);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final arguments =
        ModalRoute.of(context)?.settings.arguments as List<ProductModel>;
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
      body: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          return Responsive(
            mobile: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 30, top: 30, bottom: 70),
              children: [
                BrandFilterWidget(
                  textTheme: textTheme,
                  selectedIndex: state.brandIndex,
                  productModel: arguments,
                ),
                const SizedBox(height: 30),
                Text(
                  "Price Range",
                  style: textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: RangeSlider(
                    values: _currentRangeValues,
                    min: 0,
                    max: 2000,
                    divisions: 10,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (newValues) {
                      setState(() {
                        _currentRangeValues = newValues;
                      });
                      context
                          .read<FilterCubit>()
                          .rangeFilter(_currentRangeValues);
                    },
                    activeColor: AppColors.selectedTextColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _currentRangeValues.start.round().toString(),
                        style: textTheme.titleMedium,
                      ),
                      Text(
                        _currentRangeValues.end.round().toString(),
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
                  textTheme: textTheme,
                  selectedIndex: state.colorIndex,
                ),
              ],
            ),
            tablet: const Column(),
            desktop: const Column(),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        isleftButtonRequired: true,
        rightButtonText: "apply",
        leftButtonText: "Reset",
        leftButtonOnPressed: () {
          context.read<FilterCubit>().resetFilters();
          setState(() {
            _currentRangeValues = const RangeValues(0, 2000);
          });
        },
        rightButtonOnPressed: () {
          final filters = context.read<FilterCubit>().getAppliedFilters();
          Navigator.pop(context);
          BlocProvider.of<DiscoverCubit>(context)
            ..sortProductCategory(ProductListSingleton.instance.productList)
            ..selectCategory(
              filters: filters,
              categoryName: filters['brandName'],
            );
        },
      ),
    );
  }
}

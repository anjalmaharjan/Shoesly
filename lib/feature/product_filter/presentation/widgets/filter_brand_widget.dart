import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/feature/product_filter/presentation/widgets/brand_widget.dart';

import '../../../../core/core.dart';
import '../cubit/filter_cubit.dart';

class BrandFilterWidget extends StatelessWidget {
  const BrandFilterWidget({
    super.key,
    required this.textTheme,
    required this.selectedIndex,
  });

  final TextTheme textTheme;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  isTickRequired: index == selectedIndex,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 30),
            itemCount: FilterConstants.brandList.length,
          ),
        ),
      ],
    );
  }
}

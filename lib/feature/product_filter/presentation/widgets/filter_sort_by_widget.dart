import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/feature/product_filter/presentation/widgets/filter_button.dart';

import '../../../../core/core.dart';
import '../cubit/filter_cubit.dart';

class SortByFilterWidget extends StatelessWidget {
  const SortByFilterWidget({
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
              return FilterItemButton(
                textTheme: textTheme,
                text: FilterConstants.sortByList[index],
                onPressed: () {
                  context.read<FilterCubit>().sortByFilterPress(index);
                },
                isSelected: index == selectedIndex,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: FilterConstants.sortByList.length,
          ),
        ),
      ],
    );
  }
}

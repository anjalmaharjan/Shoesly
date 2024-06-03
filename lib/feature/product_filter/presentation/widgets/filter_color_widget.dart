import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/feature/product_filter/presentation/widgets/filter_button.dart';

import '../../../../core/core.dart';
import '../cubit/filter_cubit.dart';

class ColorFilterWidget extends StatelessWidget {
  const ColorFilterWidget({
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
              return FilterItemButton(
                color: FilterConstants.shoesColor[index]['color'],
                iconRequired: true,
                textTheme: textTheme,
                isSelected: selectedIndex == index,
                text: FilterConstants.shoesColor[index]['name'],
                onPressed: () {
                  context.read<FilterCubit>().colorPress(index);
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: FilterConstants.shoesColor.length,
          ),
        ),
      ],
    );
  }
}

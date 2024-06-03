import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/feature/product_filter/presentation/widgets/filter_button.dart';
import '../../../../core/core.dart';
import '../cubit/filter_cubit.dart';

class GenderFilterWidget extends StatelessWidget {
  const GenderFilterWidget({
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
              final genderIndex = gender.index;
              final text = gender.name.capitalizeFirst();
              return FilterItemButton(
                textTheme: textTheme,
                isSelected: index == selectedIndex,
                text: text,
                onPressed: () {
                  context.read<FilterCubit>().genderPress(genderIndex);
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: Gender.values.length,
          ),
        ),
      ],
    );
  }
}

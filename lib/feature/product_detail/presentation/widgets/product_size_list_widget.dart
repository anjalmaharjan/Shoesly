import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../discover/data/models/product_model.dart';
import '../cubit/product_detail_cubit.dart';
import 'product_size_widget.dart';

class ProductSizeListWidget extends StatelessWidget {
  const ProductSizeListWidget({
    super.key,
    required this.product,
    required this.textTheme,
  });

  final ProductModel product;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        return SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: product.size?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductSizeWidget(
                textTheme: textTheme,
                size: double.parse("${product.size?[index]}"),
                isSelected: index == state.shoeSize,
                onTap: () {
                  context.read<ProductDetailCubit>().selectedShoeSize(index);
                },
              );
            },
          ),
        );
      },
    );
  }
}

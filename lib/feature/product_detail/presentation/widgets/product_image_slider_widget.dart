import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/feature/product_detail/presentation/cubit/product_detail_cubit.dart';

import '../../../../core/core.dart';
import '../../../../core/product_model.dart';

class ProductImageSliderWidget extends StatelessWidget {
  const ProductImageSliderWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Stack(
        children: [
          Container(
            height: 315,
            color: AppColors.itemBackgroundColor,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 178,
                  child: Hero(
                    tag:
                        "${product.name ?? 0}${product.brand ?? 0} ${product.name ?? 0}${product.id ?? 0}",
                    child: Image.network(
                      product.image ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              return Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      FilterConstants.shoesColor.length,
                      (index) => GestureDetector(
                        onTap: () {
                          context
                              .read<ProductDetailCubit>()
                              .selectProductColor(index);
                        },
                        child: Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: FilterConstants.shoesColor[index]['color'],
                            border: Border.all(
                                color: AppColors.itemBackgroundColor),
                          ),
                          child: index == state.selectedColor
                              ? SvgPicture.asset(
                                  "assets/svgs/tick.svg",
                                  fit: BoxFit.fitHeight,
                                  color: AppColors.backgroundColor ==
                                          FilterConstants.shoesColor[index]
                                              ['color']
                                      ? AppColors.selectedTextColor
                                      : AppColors.backgroundColor,
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

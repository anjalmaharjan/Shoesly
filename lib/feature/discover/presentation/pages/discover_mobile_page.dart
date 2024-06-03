import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/enum/enum.dart';
import 'package:shoesly/core/product_model.dart';
import '../../../../core/routes.dart';
import '../../../../core/widgets/category_item_widget.dart';
import '../../../../core/widgets/product_item_widget.dart';
import '../cubit/discover_cubit.dart';

class DisoverPageMobile extends StatelessWidget {
  const DisoverPageMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      builder: (context, state) {
        return state.status == ApiRequestStates.loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discover",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.cart);
                          },
                          icon: Stack(
                            children: [
                              SvgPicture.asset("assets/svgs/bag.svg"),
                              Positioned(
                                right: 0,
                                top: 3,
                                child: SvgPicture.asset("assets/svgs/dot.svg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 14),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryItem(
                        isSelected: index == state.categoryIndex,
                        text: state.productModelList?[index].brand ?? "",
                        onPressed: () {
                          context.read<DiscoverCubit>().selectCategory(index);
                        },
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 4),
                      itemCount: state.productModelList?.length ?? 0,
                    ),
                  ),
                  Flexible(
                    flex: 40,
                    child: ProductItem(
                      productList: state.productModelList as List<ProductModel>,
                    ),
                  ),
                ],
              );
      },
    );
  }
}

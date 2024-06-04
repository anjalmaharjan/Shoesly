import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/theme/styles_manager.dart';
import 'package:shoesly/feature/product_review/presentation/cubit/product_review_cubit.dart';

import '../../../../core/core.dart';
import '../../../../core/product_model.dart';

class ProductReviewPage extends StatefulWidget {
  const ProductReviewPage({super.key});

  @override
  State<ProductReviewPage> createState() => _ProductReviewPageState();
}

class _ProductReviewPageState extends State<ProductReviewPage> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as ProductModel;

    return BlocProvider(
      create: (context) =>
          ProductReviewCubit()..sortReviewList(product.review!),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 30),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
          title: Text(
            "Review(1045)",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            SizedBox(
              height: 20,
              width: 20,
              child: SvgPicture.asset("assets/svgs/star.svg"),
            ),
            const SizedBox(width: 4),
            Text(
              "4.5",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: FontSize.s14),
            ),
            const SizedBox(width: 30)
          ],
        ),
        body: Responsive(
          mobile: Column(
            children: [
              const SizedBox(height: 15),
              SizedBox(
                height: 40,
                child: BlocBuilder<ProductReviewCubit, ProductReviewState>(
                  builder: (context, state) {
                    return ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: state.selectedCategoryIndex == index
                            ? const EdgeInsets.only(left: 14.0)
                            : EdgeInsets.zero,
                        child: CategoryItem(
                          isSelected: state.selectedCategoryIndex == index,
                          text: context
                              .read<ProductReviewCubit>()
                              .reviewCategoryList[index],
                          onPressed: () {
                            context
                                .read<ProductReviewCubit>()
                                .selectedCategory(index);
                          },
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 4),
                      itemCount: context
                          .read<ProductReviewCubit>()
                          .reviewCategoryList
                          .length,
                    );
                  },
                ),
              ),
              BlocBuilder<ProductReviewCubit, ProductReviewState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 70, right: 30, left: 30),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return state.reviewList!.isEmpty
                            ? Center(
                                child: Text(
                                  "Nothing in List",
                                  style: getMediumtyle(
                                    color: AppColors.unselectedTextColor,
                                    fontSize: FontSize.s16,
                                  ),
                                ),
                              )
                            : CommentItemWidget(
                                commentModel: state.reviewList?[index],
                              );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 30,
                      ),
                      itemCount: state.reviewList!.isEmpty
                          ? 1
                          : state.reviewList?.length ?? 0,
                    ),
                  );
                },
              )
            ],
          ),
          tablet: const Row(),
          desktop: const Row(),
        ),
      ),
    );
  }
}

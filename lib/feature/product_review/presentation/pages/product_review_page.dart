import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/core/responsive.dart';
import 'package:shoesly/core/theme/font_manager.dart';
import 'package:shoesly/core/utlis/dummy_data.dart';
import 'package:shoesly/feature/product_detail/presentation/pages/product_detail_page.dart';

import '../../../../core/widgets/category_item_widget.dart';

class ProductReviewPage extends StatefulWidget {
  const ProductReviewPage({super.key});

  @override
  State<ProductReviewPage> createState() => _ProductReviewPageState();
}

class _ProductReviewPageState extends State<ProductReviewPage> {
  List reviewCategoryList = [
    'All',
    "5 Stars",
    "4 Stars",
    '3 Stars',
    "2 Stars",
    '1 Star'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 14.0)
                      : EdgeInsets.zero,
                  child: CategoryItem(
                    isSelected: false,
                    text: reviewCategoryList[index],
                    onPressed: () {},
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 4),
                itemCount: reviewCategoryList.length,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 70, right: 30, left: 30),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CommentItemWidget(
                    commentModel: DummyData.reviewList[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 30,
                ),
                itemCount: DummyData.reviewList.length,
              ),
            )
          ],
        ),
        tablet: const Row(),
        desktop: const Row(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/product_model.dart';
import 'package:shoesly/core/routes.dart';

import '../responsive.dart';
import '../theme/app_colors.dart';

class ProductItem extends StatelessWidget {
  final List<ProductModel>? productList;
  const ProductItem({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 840),
      child: GridView.builder(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisExtent: 250,
          crossAxisSpacing: 15,
        ),
        itemCount: productList?.length,
        itemBuilder: (BuildContext context, int index) {
          final textTheme = Theme.of(context).textTheme;
          final product = productList?[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.productDetail,
                arguments: productList?[index],
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          color: AppColors.itemBackgroundColor,
                          width: Responsive.isMobile(context)
                              ? 150
                              : double.infinity,
                          padding: const EdgeInsets.only(top: 30),
                          child: Hero(
                            tag:
                                "${product?.name ?? 0}${product?.brand ?? 0} ${product?.name ?? 0}${product?.id ?? 0}",
                            child: Image.network(
                              productList?[index].image ?? "",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.network(
                              productList?[index].brandLogo ?? ""),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        productList?[index].name ?? "N/A",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleSmall,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SvgPicture.asset(
                              "assets/svgs/star.svg",
                              semanticsLabel: 'Star',
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '',
                              children: [
                                TextSpan(
                                  text:
                                      '${productList?[index].rating ?? "N/A"}  ',
                                  style: textTheme.titleSmall!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                  text:
                                      '(${productList?[index].review?.length ?? "No"} Reviews)',
                                  style: textTheme.titleSmall!.copyWith(
                                    color: AppColors.unselectedTextColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${productList?[index].price ?? "N/A"}",
                        style: textTheme.titleLarge!.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class ProductItemModel {
//   final int? id;
//   final String? name;
//   final double? rating;
//   final double? reviewCount;
//   final double? price;
//   final String? image;
//   final String? logo;
//   final String? descrption;
//   final List<double>? size;
//   final List<ProductReviewModel>? reviewList;

//   ProductItemModel({
//     this.reviewList,
//     this.size,
//     this.descrption,
//     required this.id,
//     required this.name,
//     required this.rating,
//     required this.reviewCount,
//     required this.price,
//     required this.image,
//     required this.logo,
//   });
// }

// class ProductReviewModel {
//   final String? image;
//   final String? name;
//   final String? comment;
//   final int? starCount;
//   final String date;

//   ProductReviewModel({
//     required this.image,
//     required this.name,
//     required this.comment,
//     required this.starCount,
//     this.date = "Today",
//   });
// }

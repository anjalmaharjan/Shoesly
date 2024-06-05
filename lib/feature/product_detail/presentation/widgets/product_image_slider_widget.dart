import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesly/feature/product_detail/presentation/cubit/product_detail_cubit.dart';

import '../../../../core/core.dart';
import '../../../discover/data/models/product_model.dart';

class ProductImageSliderWidget extends StatefulWidget {
  const ProductImageSliderWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductImageSliderWidget> createState() =>
      _ProductImageSliderWidgetState();
}

class _ProductImageSliderWidgetState extends State<ProductImageSliderWidget> {
  late CarouselController controller;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = CarouselController();
  }

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
                        "${widget.product.name ?? 0}${widget.product.brand ?? 0} ${widget.product.name ?? 0}${widget.product.id ?? 0}",
                    child: CarouselSlider(
                      carouselController: controller,
                      items: List.generate(
                        3,
                        (index) => Image.network(
                          widget.product.image ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                      options: CarouselOptions(
                        height: 400,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
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
          Positioned(
            bottom: 8,
            left: 16,
            child: DotsIndicator(
              dotsCount: 3,
              position: currentIndex,
              onTap: (position) {
                controller.animateToPage(position);
              },
              decorator: DotsDecorator(
                activeColor: AppColors.selectedTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

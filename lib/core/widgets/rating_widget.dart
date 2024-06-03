import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingStarWidget extends StatelessWidget {
  const RatingStarWidget({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 12,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            padding: const EdgeInsets.only(right: 5.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: SvgPicture.asset(
                  "assets/svgs/light_star.svg",
                  semanticsLabel: 'Star',
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 12,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: rating >= 5 ? 5 : rating,
            padding: const EdgeInsets.only(right: 5.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: SvgPicture.asset(
                  "assets/svgs/star.svg",
                  semanticsLabel: 'Star',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

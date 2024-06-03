import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core.dart';

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
    required this.textTheme,
    required this.title,
    required this.subTitle,
    required this.onTapTile,
    required this.onTapIcon,
  });

  final TextTheme textTheme;
  final String title, subTitle;
  final VoidCallback onTapTile, onTapIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapTile,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style:
            textTheme.titleLarge?.copyWith(fontSize: FontSize.s14, height: 3),
      ),
      subtitle: Text(
        subTitle,
        style: textTheme.titleSmall?.copyWith(fontSize: FontSize.s14),
      ),
      trailing: IconButton(
        onPressed: onTapIcon,
        icon: SvgPicture.asset("assets/svgs/arrow_right.svg"),
      ),
    );
  }
}

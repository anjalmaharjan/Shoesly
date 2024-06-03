import 'package:shoesly/core/theme/app_colors.dart';

class FilterConstants {
  static const List sortByList = ["Most recent", "Lowest price", "Highest"];
  static List shoesColor = [
    {
      "name": "Black",
      "color": AppColors.selectedTextColor,
    },
    {
      "name": "White",
      "color": AppColors.backgroundColor,
    },
    {
      "name": "Red",
      "color": AppColors.errorColor,
    }
  ];

  static List brandList = [
    {
      "name": "Nike",
      "review": AppColors.selectedTextColor,
    },
    {
      "name": "Erke",
      "review": AppColors.backgroundColor,
    },
    {
      "name": "Addidas",
      "review": AppColors.errorColor,
    }
  ];
}

enum Gender { man, woman, unisex }

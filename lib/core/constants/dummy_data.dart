import '../widgets/product_item_widget.dart';

class DummyData {
  static List<ProductItemModel> dummyProductList = [
    ProductItemModel(
      name: "Jordan 1 Retro High Tie Dye",
      rating: 4.5,
      reviewCount: 1045,
      price: 23500,
      image: "assets/images/image 27.png",
      logo: "assets/svgs/star.svg",
      id: 1,
      size: [39.0, 39.5, 40, 40.5, 41],
      reviewList: reviewList,
      descrption: description,
    ),
    ProductItemModel(
      name: "Jordan 1 Retro High Tie Dye",
      rating: 4.5,
      reviewCount: 1045,
      price: 23500,
      image: "assets/images/image 27.png",
      logo: "assets/svgs/star.svg",
      id: 2,
      size: [39, 39.5, 40, 40.5, 41],
      reviewList: reviewList,
      descrption: description,
    ),
    ProductItemModel(
      name: "Jordan 1 Retro High Tie Dye",
      rating: 4.5,
      reviewCount: 1045,
      price: 23500,
      image: "assets/images/image 27.png",
      logo: "assets/svgs/star.svg",
      id: 3,
      size: [39, 39.5, 40, 40.5, 41],
      reviewList: reviewList,
      descrption: description,
    ),
    ProductItemModel(
      name: "Jordan 1 Retro High Tie Dye",
      rating: 4.5,
      reviewCount: 1045,
      price: 23500,
      image: "assets/images/image 27.png",
      logo: "assets/svgs/star.svg",
      id: 4,
      size: [39, 39.5, 40, 40.5, 41],
      reviewList: reviewList,
      descrption: description,
    ),
    ProductItemModel(
      name: "Jordan 1 Retro High Tie Dye",
      rating: 4.5,
      reviewCount: 1045,
      price: 23500,
      image: "assets/images/image 27.png",
      logo: "assets/svgs/star.svg",
      id: 5,
      size: [39, 39.5, 40, 40.5, 41],
      reviewList: reviewList,
      descrption: description,
    ),
    ProductItemModel(
      name: "Jordan 1 Retro High Tie Dye",
      rating: 4,
      reviewCount: 1045,
      price: 23500,
      image: "assets/images/image 27.png",
      logo: "assets/svgs/star.svg",
      id: 6,
      size: [39, 39.5, 40, 40.5, 41],
      reviewList: reviewList,
      descrption: description,
    ),
    ProductItemModel(
      name: "Jordan 1 Retro High Tie Dye",
      rating: 4.5,
      reviewCount: 1045,
      price: 23500,
      image: "assets/images/image 27.png",
      logo: "assets/svgs/star.svg",
      id: 7,
      size: [39, 39.5, 40, 40.5, 41],
      reviewList: reviewList,
      descrption: description,
    ),
  ];

  static List<String> categoryList = [
    "All",
    "Nike",
    "Addidas",
    "Puma",
    "Erike",
    "Sketchers"
  ];

  static String networkImage =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  static String name = "Ram Maharjan";
  static String comment = "This is a very good application you have developed.";
  static int starCount = 5;
  static String description =
      "Enginered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ";

  static List<ProductReviewModel> reviewList = [
    ProductReviewModel(
      image: networkImage,
      name: name,
      comment: comment,
      starCount: starCount,
      date: "Today",
    ),
    ProductReviewModel(
      image: networkImage,
      name: name,
      comment: comment,
      starCount: starCount,
      date: "Yesterday",
    ),
    ProductReviewModel(
      image: networkImage,
      name: name,
      comment: comment,
      starCount: starCount,
      date: "Yesterday",
    ),
    ProductReviewModel(
      image: networkImage,
      name: name,
      comment: comment,
      starCount: starCount,
      date: "Today",
    ),
    ProductReviewModel(
      image: networkImage,
      name: name,
      comment: comment,
      starCount: starCount,
      date: "Today",
    ),
  ];
}

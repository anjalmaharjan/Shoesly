class ProductModel {
  int? id;
  String? name;
  String? brand;
  int? rating;
  String? description;
  List<int>? size;
  double? price;
  String? brandLogo;
  int? shippingCost;
  String? image;
  List<Review>? review;
  int? cartQuantity;
  double? totalPrice;
  double? selectedSize;

  ProductModel({
    this.id,
    this.name,
    this.brand,
    this.rating,
    this.description,
    this.size,
    this.price,
    this.brandLogo,
    this.shippingCost,
    this.image,
    this.review,
    this.cartQuantity,
    this.selectedSize,
    this.totalPrice,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brand = (json['brand']);
    rating = json['rating'];
    description = json['description'];
    size = json['size'].cast<int>();
    price = double.parse("${json['price']}");
    brandLogo = json['brandLogo'];
    shippingCost = json['shippingCost'];
    image = json['image'];
    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['brand'] = brand;
    data['rating'] = rating;
    data['description'] = description;
    data['size'] = size;
    data['price'] = price;
    data['brandLogo'] = brandLogo;
    data['shippingCost'] = shippingCost;
    data['image'] = image;
    if (review != null) {
      data['review'] = review!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Review {
  String? name;
  String? description;
  int? rating;
  String? image;

  Review({this.name, this.description, this.rating, this.image});

  Review.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    rating = json['rating'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['rating'] = rating;
    data['image'] = image;
    return data;
  }
}
